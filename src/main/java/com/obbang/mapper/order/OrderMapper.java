package com.obbang.mapper.order;

import java.util.List;

import com.obbang.model.Criteria;
import com.obbang.model.member.MemberVO;
import com.obbang.model.order.OrderDTO;
import com.obbang.model.order.OrderItemDTO;
import com.obbang.model.order.OrderPageItemDTO;
import com.obbang.model.store.StoreVO;

public interface OrderMapper {
	/* 주문 상품 정보 */	
	public OrderPageItemDTO getMenuInfo(int menu_id);
	/* 주문 상품 정보(주문 처리) */	
	public OrderItemDTO getOrderInfo(int menu_id);
	/* 주문 테이블 등록 */
	public int enrollOrder(OrderDTO ord);
	/* 주문 아이템 테이블 등록 */
	public int enrollOrderItem(OrderItemDTO orid);
	/* 주문 금액 차감 */
	public int deductMoney(MemberVO member);
	/* 주문 재고 차감 */
	public int deductStock(StoreVO book);
	/* 주문 취소 */
	public int orderCancle(String orderId);
	
	/* 주문 상품 정보(주문취소) */
	public List<OrderItemDTO> getOrderItemInfo(String orderId);
	
	/* 주문 정보(주문취소) */
	public OrderDTO getOrder(String orderId);
	/* 주문 상세 정보 */
	public List<OrderDTO> getOrderDetail(Criteria cri);
	 //주문 총 개수
	public int getOrderTotal(Criteria cri);
}
