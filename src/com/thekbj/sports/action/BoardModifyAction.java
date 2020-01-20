package com.thekbj.sports.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thekbj.comm.Action;
import com.thekbj.comm.ForwardAction;
import com.thekbj.dto.TableDTO;
import com.thekbj.service.SportsService;

public class BoardModifyAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String n=request.getParameter("num");
		int boardnum=1;
		if(n!=null && !n.equals(""))
		{
			boardnum=Integer.parseInt(n);
		}
		SportsService service=SportsService.getService();
		TableDTO dto= service.boardDetail(boardnum);
		request.setAttribute("dto", dto);
		ForwardAction forward=new ForwardAction();
		forward.setForward(true);
		forward.setUrl("/WEB-INF/sports/modify.jsp");
		System.out.println(forward.isForward()+"!!! for");
		return forward;
	}
}