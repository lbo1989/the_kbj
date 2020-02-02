package com.thekbj.comm;

import java.io.FileReader;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontController
 */
@WebServlet(urlPatterns= {"*.do"}, initParams= {@WebInitParam(name="init", value="/WEB-INF/comm/prop.properties")})
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doReq(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doReq(request, response);
	}
	private Hashtable<String, Action> ht=new Hashtable<>();
	@Override
	public void init(ServletConfig config) throws ServletException{
		String inital=config.getInitParameter("init");
		Properties prop=new Properties();
		
		try {
			String path=config.getServletContext().getRealPath(inital);
			prop.load(new FileReader(path));
			
			Enumeration enu=prop.keys();
			while(enu.hasMoreElements()) {
				String key=(String)enu.nextElement();
				String value=prop.getProperty(key);
				
				Class c=Class.forName(value);
				
				Action obj=(Action)c.newInstance();
				System.out.println(key+", "+value);
				ht.put(key, obj);
			}
			
		}catch(Exception e) {
			System.out.println(e);
		}
	}
	
	protected void doReq(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path=request.getServletPath();
		Action act=null;
		
		act=ht.get(path);
		System.out.println("path : " + path);
		ForwardAction forward = act.execute(request, response);
		if(forward.isForward()) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getUrl());
			dispatcher.forward(request, response);
		}else {
			response.sendRedirect(forward.getUrl());
		}
	}
}
