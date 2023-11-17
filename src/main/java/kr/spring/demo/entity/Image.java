package kr.spring.demo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Image {
	
	private String photo_date;
	private String photo_link;
	private String user_id;
	
	
	
	}

