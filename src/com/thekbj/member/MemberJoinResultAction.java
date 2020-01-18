package com.thekbj.member;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thekbj.comm.Action;
import com.thekbj.comm.ForwardAction;
import com.thekbj.dto.MemberDTO;
import com.thekbj.service.MemberService;

public class MemberJoinResultAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("MemberJoinResultAction Load"); 

		String mimg = request.getParameter("join_image");
		String mid = request.getParameter("join_id");
		String mpw = request.getParameter("join_pw");
		String mnick = request.getParameter("join_nik");
		String mname = request.getParameter("join_name");
		String memail = request.getParameter("join_email");
		int mscore = 0;
		
		int myear = Integer.parseInt(request.getParameter("join_year"));
		int mmonth = Integer.parseInt(request.getParameter("join_month"));
		int mday = Integer.parseInt(request.getParameter("join_day"));
		
		//��¥���ϱ�
		SimpleDateFormat formatDate = new SimpleDateFormat ( "yyyy-MM-dd");
		SimpleDateFormat formatDate2 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		
		//������ ���ϱ�
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, myear);
		cal.set(Calendar.MONTH, mmonth-1);
		cal.set(Calendar.DATE, mday);
		Timestamp tt = new Timestamp(cal.getTimeInMillis());
		String mbdate = formatDate.format(tt);
		
		//������ ��¥+�ð� ���ϱ�
		Timestamp tt2 = new Timestamp(System.currentTimeMillis());
		String mjoindate = formatDate2.format(tt2);
		
		
		//dto ���ϱ�
		MemberDTO dto = new MemberDTO();
		dto.setMid(mid);
		dto.setMpw(mpw);
		dto.setMname(mname);
		dto.setMbdate(mbdate);
		dto.setMemail(memail);
		dto.setMnick(mnick);
		dto.setMscore(mscore);
		dto.setMjoindate(mjoindate);
		dto.setMimg(mimg);
		
		//���� ����
		MemberService service = MemberService.getMemberservice();
		int result = service.memberJoin(dto);
		
		//���
		ForwardAction forward = new ForwardAction();
		if(result == 0)
		{
			//���Խ���
			forward.setForward(true);
			forward.setUrl("/WEB-INF/comm/join.html");
		}
		else
		{
			//���Լ���
			forward.setForward(true);
			forward.setUrl("/WEB-INF/comm/login.html");
		}
		
		
		return forward;
	}

}
