package com.obbang.model.cart;

import java.util.List;

import com.obbang.model.image.ImageVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartDTO {
	   private int cart_id;
	    
	    private String user_id;
	    
	    private int menu_id;
	    
	    private int menuCount;
	    
	    //menu
	    
	    private String menu_menu;
	    
	    private int menu_price;
	    
	    private double menu_discount;
	    
	    // 추가
	    private int salePrice;
	    
	    private int totalPrice;
	    
	    /* 상품 이미지 */
		private List<ImageVO> imageList;
		
		
	    
	    public void initSaleTotal() {
			this.salePrice = (int) (this.menu_price * (1-this.menu_discount));
			this.totalPrice = this.salePrice*this.menuCount;
		}
}
