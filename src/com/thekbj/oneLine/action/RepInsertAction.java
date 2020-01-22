package com.thekbj.oneLine.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thekbj.comm.Action;
import com.thekbj.comm.ForwardAction;
import com.thekbj.service.OneLineService;

public class RepInsertAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("RepInsertAction Load");
		
		String content = request.getParameter("content");
		int mno = Integer.parseInt(request.getParameter("mno"));
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		OneLineService service = OneLineService.getService(); 
		int result = service.repInsert(content,mno, bno);
		
		request.setAttribute("result", result);
		
		ForwardAction forward = new ForwardAction();
		forward.setForward(true);
		forward.setUrl("/WEB-INF/oneLine/repInsert.jsp");
		 
		return forward;
	}

}
