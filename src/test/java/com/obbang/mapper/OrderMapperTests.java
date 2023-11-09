package com.obbang.mapper;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.obbang.mapper.order.OrderMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class OrderMapperTests {
	
	@Autowired
	private OrderMapper mapper;
	
	/* 상품 정보(주문 처리) */
//	@Test
//	public void getOrderInfoTest() {
//		
//		 OrderItemDTO orderInfo = mapper.getOrderInfo(45);
//		 
//		 System.out.println("result : " + orderInfo);
//	}
	
	/* vam_order 테이블 등록 */
//	@Test
//	public void enrollOrderTest() {
//		
//		OrderDTO ord = new OrderDTO();
//		List<OrderItemDTO> orders = new ArrayList();
//		
//		OrderItemDTO order1 = new OrderItemDTO();
//		
//		order1.setMenu_id(45);
//		order1.setMenuCount(5);
//		order1.setMenu_price(70000);
//		order1.initSaleTotal();
//		
//		
//		
//		ord.setOrders(orders);
//		
//		ord.setOrder_id("2021_test1");
//		ord.setOrder_adress("test");
//		ord.setUser_id("hong");
//		ord.setUser_address1("test");
//		ord.setUser_address2("test");
//		ord.setUser_address3("test");
//		ord.setOrder_State("배송준비");
//		ord.getOrderPriceInfo();
//		
//		mapper.enrollOrder(ord);		
//		
//	}
	
	/* vam_itemorder 테이블 등록 */
//	@Test
//	public void enrollOrderItemTest() {
//		
//		OrderItemDTO oid = new OrderItemDTO();
//		
//		oid.setOrder_id("2021_test1");
//		oid.setMenu_id(46);
//		oid.setMenuCount(1);
//		oid.setMenu_price(70000);
//				
//		oid.initSaleTotal();
//		
//		mapper.enrollOrderItem(oid);
//		
//	}	
	
	/* 회원 돈, 포인트 정보 변경 */
//	@Test
//	public void deductMoneyTest() {
//		
//		MemberVO member = new MemberVO();
//		
//		member.setUser_id("hong");
//		member.set(500000);
//		member.setPoint(10000);
//		
//		mapper.deductMoney(member);
//	}
	
	/* 상품 재고 변경 */
//	@Test
//	public void deductStockTest() {
//		StoreVO book = new StoreVO();
//		
//		book.setMenu_id(44);
//		book.setBookStock(77);
//		
//		mapper.deductStock(book);
//	}
}
