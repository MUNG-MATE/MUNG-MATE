package edu.kh.mung.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.kh.mung.member.model.dto.Member;

@WebFilter(filterName = "loginFilter", urlPatterns = {"/myPage/*"})

public class LoginFilter implements Filter {

	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("--- 로그인 필터 생성 ---");
	}
	
	public void destroy() {
		System.out.println("--- 로그인 필터 파괴 ---");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		
		HttpSession session = req.getSession();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		if(loginMember == null) {
			session.setAttribute("message", "로그인 후 이용해주세요. 제발~");
			resp.sendRedirect("/");
		} else {
			chain.doFilter(request, response);
		}
		
	}

}
