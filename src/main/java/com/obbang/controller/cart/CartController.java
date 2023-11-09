package com.obbang.controller.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.obbang.model.cart.CartDTO;
import com.obbang.model.member.MemberVO;
import com.obbang.service.cart.CartService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class CartController {
	@Autowired
	private CartService cartService;

	@PostMapping("/cart/add")
	@ResponseBody
	public String addCartPOST(CartDTO cart, HttpServletRequest request) {
		// 로그인 체크
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("user");
		if(mvo == null) {
			return "5";
		}
		// 카트 등록

		int result = cartService.addCart(cart);

		return result + "";
	}
	@GetMapping("/cart/{user_id}")
	public String cartPageGET(@PathVariable("user_id") String user_id, Model model) {
		model.addAttribute("cartInfo", cartService.getCartList(user_id));
		return "/cart";
	}
	/* 장바구니 수량 수정 */
	@PostMapping("/cart/update")
	public String updateCartPOST(CartDTO cart) {
		cartService.modifyCount(cart);

		return "redirect:/cart/" + cart.getUser_id();

	}
	/* 장바구니 수량 수정 */
	@PostMapping("/cart/delete")
	public String deleteCartPOST(CartDTO cart) {

		cartService.deleteCart(cart.getCart_id());

		return "redirect:/cart/" + cart.getUser_id();
	}
}
