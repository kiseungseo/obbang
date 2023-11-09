package com.obbang.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.obbang.model.member.MemberVO;

public class CartInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();

		MemberVO mvo = (MemberVO)session.getAttribute("user");

		if(mvo == null) {
			response.sendRedirect("/member/login");
			return false;
		} else {
			return true;
		}
	}

}
