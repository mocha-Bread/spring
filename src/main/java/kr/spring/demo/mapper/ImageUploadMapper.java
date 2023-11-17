package kr.spring.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.demo.entity.Image;
import kr.spring.demo.entity.result;

@Mapper
public interface ImageUploadMapper {
    public void uploadImage(Image image2);

	public void resultUpload(result image3);

	
}
	


