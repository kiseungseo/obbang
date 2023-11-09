package com.obbang.model.order;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderCancelDTO {
	
	private String user_id;
	
	private String order_id;
	

	private String keyword;
	
	private int amount;
	
	private int pageNum;
}
