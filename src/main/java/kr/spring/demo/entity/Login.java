package kr.spring.demo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data // getter, setter 메소드를 만들어주는 어노테이션
@AllArgsConstructor // 전체 필드의 개수만큼 매개변수를 받아 생성하는 생성자
@NoArgsConstructor // 기본 생성자 (필수)
@ToString // 필드의 값을 빠르게 확인하기 위한 메소드
public class Login {
	
	private String user_id; // 사용자 아이디
    private String user_password; // 사용자 비밀번호
    private String user_name; // 사용자 이름
    private String medical_number; // 사용자 의료코드
    
    // user_id getter & setter
    public String getUserID() {
    	return user_id;
    }
    
    public void setUserID(String user_id) {
    	this.user_id = user_id;
    }
    
    // password getter & setter
    public String getPassword() {
    	return user_password;
    }
    
    public void setPassword(String user_password) {
    	this.user_password = user_password;
    }
    
}