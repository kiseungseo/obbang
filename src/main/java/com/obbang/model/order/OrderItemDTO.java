package com.obbang.model.order;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderItemDTO {
	/* 주문 번호 */
	private String order_id;
	
	/* 상품 번호 */
    private int menu_id;
    
	/* 주문 수량 */
    private int menuCount;
    
	/* vam_orderItem 기본키 */
    private int orderItem_id;
    
	/* 상품 한 개 가격 */
    private int menu_price;
    
	/* 상품 할인 율 */
    private double menuDiscount;
    
	/* 상품 한개 구매 시 획득 포인트 */
    private int savePoint;
    
	/* DB테이블 존재 하지 않는 데이터 */
    
	/* 할인 적용된 가격 */
    private int salePrice;
    
	/* 총 가격(할인 적용된 가격 * 주문 수량) */
    private int totalPrice;
    
	/* 총 획득 포인트(상품 한개 구매 시 획득 포인트 * 수량) */
    private int totalSavePoint;
    
	public void initSaleTotal() {
		this.salePrice = (int) (this.menu_price * (1-this.menuDiscount));
		this.totalPrice = this.salePrice*this.menuCount;
	}
}
