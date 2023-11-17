package kr.spring.demo.mapper;



import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.spring.demo.entity.Login;

@Mapper
public interface LoginMapper {

    // 사용자 회원가입 정보 저장 메소드
    void registerUser(Login login);
    
    // 사용자 로그인 정보 조회 메소드
    Login getLoginInfo(@Param("user_id") String user_id, @Param("user_password") String user_password);
	
    
    // 마이페이지에서 사용자 정보 조회 메소드
    Login getUserDetails(@Param("user_id") String user_id);

	
}

