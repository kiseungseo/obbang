package com.obbang.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.obbang.model.cart.CartDTO;
import com.obbang.service.cart.CartService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CartServiceTests {
	
	@Autowired
	private CartService service;
	
	//등록 테스트
		@Test
		public void addCartTest() {
			//given
				String memberId = "414141";
				int bookId = 47;
				int count = 5;
				
				CartDTO dto = new CartDTO(); 
				dto.setUser_id(memberId);
				dto.setMenu_id(bookId);
				dto.setMenuCount(count);
			
			//when
				int result = service.addCart(dto);
			
			//then
				System.out.println("** result : " + result);
			
			
		}
}
