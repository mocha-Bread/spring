package kr.spring.demo.controller;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.PutObjectRequest;
import kr.spring.demo.entity.Login;
import kr.spring.demo.entity.UserService;

import kr.spring.demo.entity.Image;
import kr.spring.demo.entity.result;
import kr.spring.demo.mapper.ImageUploadMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import jakarta.servlet.http.HttpSession;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

@Controller
public class MainController {
    
    @RequestMapping("/")
    public String main() {
        System.out.println("완료");
        return "index";
    }
	
	@Autowired
	private ImageUploadMapper mapper;
	
	@Autowired
	private UserService userService;
	
    private String bucketName = "project212";
    private final AmazonS3 s3Client; // AmazonS3 빈을 주입받기 위한 필드 추가
    public MainController(AmazonS3 s3Client) {
        this.s3Client = s3Client;
    }
    
    
    @PostMapping("/imageupload.do")
    @ResponseBody
    public Map<String, String> uploadImage(@RequestParam("image") MultipartFile image,HttpSession session) throws IOException {
    	
        File file = convertMultiPartToFile(image);
        String fileName = generateFileName(image);
        uploadFileTos3bucket(fileName, file);
        file.delete();
        
        
        Login user = (Login) session.getAttribute("info");
        String photo_date = LocalDate.now().toString();
        String user_id = user.getUser_id();

        String photo_link = String.format("https://s3.%s.amazonaws.com/%s/%s", 
            "ap-northeast-2", // 리전 이름
            bucketName, // 버킷 이름
            fileName // 파일 이름
        );
        Image image2 = new Image(photo_date, photo_link, user_id);
        
        mapper.uploadImage(image2);
        
        RestTemplate restTemplate = new RestTemplate();

        
        String predictUrl = "http://127.0.0.1:5000/predict";

        // Create a map for the request body
        Map<String, String> body = new HashMap<>();
        body.put("url", photo_link);

        // Set the headers
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        // Create the request entity
        HttpEntity<Map<String, String>> requestEntity = new HttpEntity<>(body, headers);

        // Send the request
        ResponseEntity<List<List<Object>>> response = restTemplate.exchange(predictUrl, HttpMethod.POST, requestEntity, new ParameterizedTypeReference<List<List<Object>>>(){});
        List<List<Object>> responseBody = response.getBody();

       
       
        
     // Parse the response body
     if (responseBody != null) {
        for (List<Object> item : responseBody) {
            String lesion_name = (String) item.get(0);
            String lesion_code = "11";
            result image3 = new result(lesion_code, photo_link, lesion_name);
            ((ImageUploadMapper) mapper).resultUpload(image3);
            Map<String, String> response2 = new HashMap<>();
            response2.put("uploadedImageLink", photo_link);
            response2.put("result", lesion_name);
            return response2;
        }
    } else {
        // responseBody가 null인 경우의 처리
    }
    return body;
        
        // Extract the value of "result"

    }

    private File convertMultiPartToFile(MultipartFile file) throws IOException {
        File convFile = new File(file.getOriginalFilename());
        FileOutputStream fos = new FileOutputStream(convFile);
        fos.write(file.getBytes());
        fos.close();
        return convFile;
    }

     
    private String generateFileName(MultipartFile multiPart) {
        String originalFilename = multiPart.getOriginalFilename();
        if (originalFilename != null) {
            return new Date().getTime() + "-" + originalFilename.replace(" ", "_");
        } else {
            throw new IllegalArgumentException("The original filename is null");
        }
    }

    private void uploadFileTos3bucket(String fileName, File file) {
    	
        s3Client.putObject(new PutObjectRequest(bucketName, fileName, file));
    }


	public ImageUploadMapper getMapper() {
		return mapper;
	}


	public void setMapper(ImageUploadMapper mapper) {
		this.mapper = mapper;
	}
	
	

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(Login login) {
    	System.out.println(login.toString());
    	userService.registerUser(login);
        return "index"; // 회원가입  성공하면 메인으로
    }
    
    @PostMapping("/login")
    public String login(@ModelAttribute Login login, Model model, RedirectAttributes rttr, HttpSession session) {
        System.out.println(login.toString());
        
        Login user = userService.Login(login.getUserID(), login.getPassword());

        if (user != null) {
            session.setAttribute("info", user);
            model.addAttribute("mTitle", "로그인 성공");
            model.addAttribute("mMsg", user.getUser_id() + "님 환영합니다.");
        } else {
            model.addAttribute("mTitle", "로그인 실패");
            model.addAttribute("mMsg", "아이디와 비밀번호를 확인하세요");
        }
        System.out.println("완료");
        return "index";
    }



    @GetMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes rttr) {
    	session.invalidate();
    	
    	rttr.addFlashAttribute("mTitle", "로그아웃 성공");
    	rttr.addFlashAttribute("mMsg", "성공적으로 로그아웃하였습니다.");
    	
    	return "redirect:/";
    	
    }
    
    @GetMapping("/mypage")
    @ResponseBody
    public Map<String, Object> myPage(Model model, HttpSession session) {
        Map<String, Object> response = new HashMap<>();

        String userId = ((Login) session.getAttribute("info")).getUserID();

        System.out.println(userId);
        if (userId != null) {
            Login userDetails = userService.getUserDetails(userId);
            if (userDetails != null) {
                response.put("user_id", userDetails.getUserID());
                response.put("user_name", userDetails.getUser_name());
                response.put("medical_number", userDetails.getMedical_number());
            }
        
        } else {
            // 유저가 인증되지 않았을 때 처리
            response.put("error", "User not authenticated");
        }

        return response;
    }
    
    
}



