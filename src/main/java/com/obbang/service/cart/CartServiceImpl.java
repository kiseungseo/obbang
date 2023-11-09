package com.obbang.service.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.obbang.mapper.cart.CartMapper;
import com.obbang.mapper.image.ImageMapper;
import com.obbang.model.cart.CartDTO;
import com.obbang.model.image.ImageVO;
@Service
public class CartServiceImpl implements CartService{

	@Autowired
	private CartMapper CartMapper;
	@Autowired
	private ImageMapper imagemapper;

	@Override
	public int addCart(CartDTO cart) {
		// 장바구니 데이터 체크
		CartDTO checkCart = CartMapper.checkCart(cart);
		if(checkCart != null) {
			return 2;
		}
		try {
			return CartMapper.addCart(cart);
		} catch (Exception e) {
			return 0;
		}
	}
	@Override
	public List<CartDTO> getCartList(String user_id) {
		List<CartDTO> cart = CartMapper.getCart(user_id);

		for(CartDTO dto : cart) {
			dto.initSaleTotal();
		/* 이미지 정보 얻기 */
		int menu_id = dto.getMenu_id();
		
		List<ImageVO> imageList = imagemapper.menuGetImageList(menu_id);
		
		dto.setImageList(imageList);
		}

		return cart;
	}
	@Override
	public int modifyCount(CartDTO cart) {
		return CartMapper.modifyCount(cart);
	}
	@Override
	public int deleteCart(int user_id) {

		return CartMapper.deleteCart(user_id);
	}
}
