package com.obbang.model.store;

import java.util.List;

import com.obbang.model.image.ImageVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StoreVO {
	//store
	private int store_id;
	private String store_store;
	private int store_price;
	private String store_adress;
	private String store_tel;
	private String store_info;
	private String store_category;
	private double ratingAvg;
	//menu
	private int menu_id;
	private String menu_menu;
	private int menu_price;
	private String menu_info;
	//category
	private int category_id;
	private String category_bread;
	private String category_coffee;
	private String category_desert;
	private String category_sandwich;
	//images
	private ImageVO imageVO;
	private List<ImageVO> imageList;
	
	
	
}
