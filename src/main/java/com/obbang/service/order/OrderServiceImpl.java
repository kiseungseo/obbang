package com.obbang.service.order;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.obbang.mapper.cart.CartMapper;
import com.obbang.mapper.member.MemberMapper;
import com.obbang.mapper.order.OrderMapper;
import com.obbang.mapper.store.StoreMapper;
import com.obbang.model.Criteria;
import com.obbang.model.cart.CartDTO;
import com.obbang.model.member.MemberVO;
import com.obbang.model.order.OrderCancelDTO;
import com.obbang.model.order.OrderDTO;
import com.obbang.model.order.OrderItemDTO;
import com.obbang.model.order.OrderPageItemDTO;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private CartMapper cartMapper;
	
	@Autowired
	private StoreMapper storeMapper;
	
	@Override
	public List<OrderPageItemDTO> getMenuInfo(List<OrderPageItemDTO> orders) {
List<OrderPageItemDTO> result = new ArrayList<OrderPageItemDTO>();		
		
		for(OrderPageItemDTO ord : orders) {
			
			OrderPageItemDTO menuInfo = orderMapper.getMenuInfo(ord.getMenu_id());			

			menuInfo.setMenuCount(ord.getMenuCount());	
			
			menuInfo.initSaleTotal();			
			
			result.add(menuInfo);			
		}		
		
		return result;
	}
	@Override
	@Transactional
	public void order(OrderDTO ord) {
		/* 사용할 데이터가져오기 */
		/* 회원 정보 */
		MemberVO member = memberMapper.getMemberInfo(ord.getUser_id());
		/* 주문 정보 */
		List<OrderItemDTO> ords = new ArrayList<>();
		for(OrderItemDTO oit : ord.getOrders()) {
			OrderItemDTO orderItem = orderMapper.getOrderInfo(oit.getMenu_id());
			// 수량 셋팅
			orderItem.setMenuCount(oit.getMenuCount());
			// 기본정보 셋팅
			orderItem.initSaleTotal();
			//List객체 추가
			ords.add(orderItem);
		}
		/* OrderDTO 셋팅 */
		ord.setOrders(ords);
		ord.getOrderPriceInfo();
		
		/*DB 주문,주문상품(,배송정보) 넣기*/
		
		/* orderId만들기 및 OrderDTO객체 orderId에 저장 */
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmm");
		String orderId = member.getUser_id() + format.format(date);
		ord.setOrder_id(orderId);
		/* db넣기 */
		orderMapper.enrollOrder(ord);		//vam_order 등록
		for(OrderItemDTO oit : ord.getOrders()) {		//vam_orderItem 등록
			oit.setOrder_id(orderId);
			orderMapper.enrollOrderItem(oit);			
		}
		/* 장바구니 제거 */
		for(OrderItemDTO oit : ord.getOrders()) {
			CartDTO dto = new CartDTO();
			dto.setUser_id(ord.getUser_id());
			dto.setMenu_id(oit.getMenu_id());
			
			cartMapper.deleteOrderCart(dto);
		}
	}
	
	@Override
	public void orderCancle(OrderCancelDTO dto) {
		/* 주문, 주문상품 객체 */
		/*회원*/
		//돈 적용할때 쓰는것이나 돈이 구현이안되서 아직x	
		MemberVO member = memberMapper.getMemberInfo(dto.getUser_id());
			
		/*주문상품*/
			List<OrderItemDTO> ords = orderMapper.getOrderItemInfo(dto.getOrder_id());
			for(OrderItemDTO ord : ords) {
				ord.initSaleTotal();
			}
		/* 주문 */
			OrderDTO orw = orderMapper.getOrder(dto.getOrder_id());
			orw.setOrders(ords);
			
			orw.getOrderPriceInfo();
			/* 주문상품 취소 DB */
			orderMapper.orderCancle(dto.getOrder_id());
	}
	 @Override
	public List<OrderDTO> getOrderDetail(Criteria cri) {
		 log.info("getOrderDetail().........");
			return orderMapper.getOrderDetail(cri);
	}
	 @Override
		public int getOrderTotal(Criteria cri) {
			return orderMapper.getOrderTotal(cri);
		}
}
