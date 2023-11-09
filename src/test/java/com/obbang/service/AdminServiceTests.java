package com.obbang.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.obbang.model.image.ImageVO;
import com.obbang.model.store.StoreVO;
import com.obbang.service.admin.AdminService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminServiceTests {
	@Autowired
	private AdminService service;
	
	/* 점포 등록 & 점포 이미지 등록 테스트 */
	@Test
	public void storeEnrollTEsts() {
		StoreVO store = new StoreVO();
		//점포 정보
		store.setStore_store("커피");
		store.setMenu_menu("커피집입니다");
		store.setMenu_price(5400);
		//이미지 정보
		List<ImageVO> imageList = new ArrayList<ImageVO>();
		
		ImageVO image1 = new ImageVO();
		ImageVO image2 = new ImageVO();
		
		
		image1.setFileName("test Images");
		image1.setUploadPath("test Image11");
		image1.setUuid("test1231");
		
	
		image2.setFileName("test Image22aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasdasdasdasdasdasdasdasdaaaa");
		image2.setUploadPath("test Image22");
		image2.setUuid("test123");
		
		imageList.add(image1);
		imageList.add(image2);
		
		store.setImageList(imageList);
		
		//storeEnroll() 메서드 호출
		service.menuEnroll(store);
		
		System.out.println("등록된 VO: " + store);
	}
	
}
