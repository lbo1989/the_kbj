package com.thekbj.member;

import java.io.IOException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.thekbj.comm.Action;
import com.thekbj.comm.ForwardAction;

public class NaverLoginAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String clientID = "B6kF4ZGEeJyby7RxQmI1";
		request.setAttribute("clientID", clientID);
		
		String redirectURI = URLEncoder.encode("http://localhost:8080/thekbj/memberJoin.do","UTF-8");
		request.setAttribute("redirectURI", redirectURI);
		
		String state = generateState();
		request.setAttribute("state", state);
		
		
		
		ForwardAction forward = new ForwardAction();
		forward.setForward(true);
		forward.setUrl("/WEB-INF/loginAPI/naver.jsp"); 
		
		return forward;
	}
	
	public String generateState()
	{
		SecureRandom random = new SecureRandom();
		return new BigInteger(130,random).toString(32);
	}

}
