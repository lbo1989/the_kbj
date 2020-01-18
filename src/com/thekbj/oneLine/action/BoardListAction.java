package com.thekbj.oneLine.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thekbj.comm.Action;
import com.thekbj.comm.ForwardAction;
import com.thekbj.service.OneLineService;
import com.thekbj.dto.ReplyDTO;
import com.thekbj.dto.TableDTO;

public class BoardListAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("BoardListAction Load");
		
		/*����¡ �ʿ��� ����*/
		
		//���� ��ü ����
		OneLineService service = OneLineService.getService(); 
		
		//���� ������
		int currpage=1;
		String curr = request.getParameter("curr");
		if(curr!=null) currpage=Integer.parseInt(curr);
		
		//total �Խñۼ� ���ϱ�
		int totalcount = service.totalcount(); //�� �� ����
		
		//�� ������ �� ����
		int pageperSize = 10;	
		int totalpage = (int) Math.ceil((float)totalcount/pageperSize); //�� ��(10����) ����
		
		//��ü ������
		int startrow = ((currpage-1) * pageperSize)+1;
		int endrow = startrow + pageperSize - 1;
		if(endrow > totalcount) endrow = totalcount;
		
		/*���������� ��ü ���*/
		
		//���α� ���
		List<TableDTO> list= service.boardList(startrow,endrow);
		
		
		//���ñ� ���
		List<ReplyDTO> replist = service.replyList();
		
		//request ��ü�� ��� ���
		request.setAttribute("list", list);
		request.setAttribute("replist", replist);
		
		request.setAttribute("currpage", currpage);
		request.setAttribute("startrow", startrow);
		request.setAttribute("endrow", endrow);
		request.setAttribute("totalpage", totalpage);
		
		ForwardAction forward = new ForwardAction();
		forward.setForward(true);
		forward.setUrl("/WEB-INF/oneLine/list.jsp");
		 
		return forward;
	}

}
