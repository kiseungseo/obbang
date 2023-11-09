package com.obbang.model.order;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderPageItemDTO {
	/* 뷰로부터 전달받을 값 */
    private int menu_id;
    
    private int menuCount;
    
	/* DB로부터 꺼내올 값 */
    private String menu_menu;
    
    private int menu_price;
    
    private double menuDiscount;
    
    /* 만들어 낼 값 */
    private int salePrice;
    
    private int totalPrice;
    
    private int point;
    
    private int totalPoint;
    public void initSaleTotal() {
		this.salePrice = (int) (this.menu_price * (1-this.menuDiscount));
		this.totalPrice = this.salePrice*this.menuCount;
	}
}
