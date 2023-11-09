package com.obbang.service.order;

import java.util.List;

import com.obbang.model.Criteria;
import com.obbang.model.order.OrderCancelDTO;
import com.obbang.model.order.OrderDTO;
import com.obbang.model.order.OrderPageItemDTO;

public interface OrderService {

	/* 주문 정보 */
	public List<OrderPageItemDTO> getMenuInfo(List<OrderPageItemDTO> orders);
	/* 주문 */
	public void  order(OrderDTO orw);
	/* 주문 취소 */
	public void orderCancle(OrderCancelDTO dto);
	/* 주문 상세정보 */
	public List<OrderDTO> getOrderDetail(Criteria cri);
	/* 주문 총 갯수 */
	public int getOrderTotal(Criteria cri);
}
