package com.obbang.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.obbang.mapper.image.ImageMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ImageTests {
	@Autowired
	private ImageMapper imageMapper;
	
	/*이미지 정보 반환*/
	@Test
	public void getAttachListTests() {
		int menu_id = 55;
		System.out.println("이미지 정보 : " + imageMapper.menuGetImageList(menu_id));
		
	}
}
