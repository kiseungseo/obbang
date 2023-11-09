package com.obbang.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.obbang.mapper.cart.CartMapper;
import com.obbang.model.cart.CartDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CartMapperTests {
	@Autowired
	CartMapper mapper;
	
	/* 장바구니 제거(주문 처리) */
	@Test
	public void deleteOrderCart() {
		String memberId = "hong";
		int bookId = 45;
		
		CartDTO dto = new CartDTO();
		dto.setUser_id(memberId);
		dto.setMenu_id(bookId);
		
		mapper.deleteOrderCart(dto);
		
	}
}
