package com.thekbj.sports.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thekbj.comm.Action;
import com.thekbj.comm.ForwardAction;
import com.thekbj.dto.TableDTO;
import com.thekbj.service.SportsService;

public class BoardListAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		SportsService service=SportsService.getService();

     	List<TableDTO> list = service.boardList();
		
		request.setAttribute("list", list);
		ForwardAction forward=new ForwardAction();
		
		forward.setForward(true);
		forward.setUrl("/WEB-INF/sports/list.jsp");
		System.out.println(list);
		return forward;
	}
}