package com.obbang.persistence;

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
	private CartMapper mapper;
	
//	@Test
//	public void addCart() {
//		String user_id = "1";
//		int menu_id = 46;
//		int count = 2;
//		
//		CartDTO cart = new CartDTO();
//		cart.setUser_id(user_id);
//		cart.setMenu_id(menu_id);
//		cart.setMenuCount(count);
//		
//		int result = 0;
//		result = mapper.addCart(cart);
//		
//		System.out.println("결과 : " + result);
//		
//	}	

	
	/* 카트 삭제 */

//	@Test
//	public void deleteCartTest() {
//		int cartId = 3;
//		
//		mapper.deleteCart(cartId);
//
//	}
	/* 카트 수량 수정 */

//	@Test
//	public void modifyCartTest() {
//		int cartId = 5;
//		int count = 5;
//		
//		CartDTO cart = new CartDTO();
//		cart.setCart_id(cartId);
//		cart.setMenuCount(count);
//		
//		mapper.modifyCount(cart);
//		
//	}

	
	/* 카트 목록 */ 

//	@Test
//	public void getCartTest() {
//		String memberId = "1";
//		
//		
//		List<CartDTO> list = mapper.getCart(memberId);
//		for(CartDTO cart : list) {
//			System.out.println(cart);
//			cart.initSaleTotal();
//			System.out.println("init cart : " + cart);
//		}
//	}
	
	
	
	/* 카트 확인 */

	@Test
	public void checkCartTest() {
		
		String user_id = "1";
		int menu_id = 45;
		
		CartDTO cart = new CartDTO();
		cart.setUser_id(user_id);
		cart.setMenu_id(menu_id);
		
		CartDTO resutlCart = mapper.checkCart(cart);
		System.out.println("결과 : " + resutlCart);
		
	}
}

