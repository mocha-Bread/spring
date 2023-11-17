package kr.spring.demo.entity;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;

import kr.spring.demo.mapper.LoginMapper;

@Configuration
@ComponentScan(basePackages = "kr.spring.demo.entity")
@Service
public class UserService {
    
    @Autowired
    private LoginMapper loginMapper;

    public void registerUser(Login login) {
        loginMapper.registerUser(login);
    }
    
    public Login Login(String user_id, String user_password) {
        return loginMapper.getLoginInfo(user_id, user_password);
    }
    
    public Login getUserDetails(String user_id) {
    	return loginMapper.getUserDetails(user_id);
    }
}