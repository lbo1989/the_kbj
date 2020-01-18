package com.thekbj.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.thekbj.comm.DBConnection;
import com.thekbj.dto.ReplyDTO;
import com.thekbj.dto.TableDTO;
import com.thekbj.oneLine.dao.BoardDAO;

public class OneLineService {
	private static OneLineService service = new OneLineService();
	
	private OneLineService() {}

	public static OneLineService getService() {
		return service;
	}

	public List<TableDTO> boardList(int startrow, int endrow) {
		System.out.println("OneLineService boardList: �Խñ� ��ü Service ��û");
		
		Connection conn = null;
		
		List<TableDTO> list = null;
		
		try 
		{
			DBConnection dbconn = DBConnection.getinstance();
			conn = dbconn.getConnection();
			conn.setAutoCommit(false);
			
			BoardDAO dao = BoardDAO.getBoardDAO();
			list = dao.boardListData(conn, startrow, endrow);
			
			conn.commit();
		}
		catch(SQLException | NamingException e)
		{
			System.out.println("OneLineService boardList : "+ e);
		}finally {
			System.out.println("OneLineService boardList: �Խñ� ��ü Service ��û ���� ����");
		}
		return list;
	}

	public int totalcount() {
		System.out.println("OneLineService totalcount: �Խñ� ���� Service ��û");
		
		Connection conn = null;
		int totalcount = 0;
		
		try 
		{
			DBConnection dbconn = DBConnection.getinstance();
			conn = dbconn.getConnection();
			conn.setAutoCommit(false);
			
			BoardDAO dao = BoardDAO.getBoardDAO();
			totalcount = dao.getTotalCountData(conn);
			
			conn.commit();
		}
		catch(SQLException | NamingException e)
		{
			System.out.println("OneLineService totalcount : "+ e);
		}finally {
			System.out.println("OneLineService totalcount: �Խñ� ���� Service ��û ���� ����");
		}
		return totalcount;
	}

	
	
	public List<ReplyDTO> replyList() {
		System.out.println("OneLineService replyList: ���� ��ü Service ��û");
		
		Connection conn = null;
		
		List<ReplyDTO> list = null;
		
		try 
		{
			DBConnection dbconn = DBConnection.getinstance();
			conn = dbconn.getConnection();
			conn.setAutoCommit(false);
			
			BoardDAO dao = BoardDAO.getBoardDAO();
			list = dao.repListData(conn);
			
			conn.commit();
		}
		catch(SQLException | NamingException e)
		{
			System.out.println("OneLineService replyList : "+ e);
		}finally {
			System.out.println("OneLineService replyList: ���� ��ü Service ��û ���� ����");
		}
		return list;
	}
	
	
}
