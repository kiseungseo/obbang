package com.obbang.controller.order;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.obbang.model.order.OrderDTO;
import com.obbang.model.order.OrderPageDTO;
import com.obbang.service.member.MemberService;
import com.obbang.service.order.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderservice;
	
	@Autowired
	private MemberService memberservice;
	
	@GetMapping("/order/{user_id}")
	public String orderPgaeGET(@PathVariable("user_id") String user_id, OrderPageDTO opd, Model model) {
		System.out.println("orders : "+ opd);	
		model.addAttribute("orderList", orderservice.getMenuInfo(opd.getOrders()));
		model.addAttribute("memberInfo", memberservice.getMemberInfo(user_id));
		
		return "/order";
	}
	
	@PostMapping("/order")
	public String orderPagePost(OrderDTO od, HttpServletRequest request) {
		
		System.out.println(od);	
		orderservice.order(od);
		
		return "redirect:/store/home";
	}
	
}
