package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Notice1DAO;
import com.smhrd.model.Notice1VO;

public class boardpost extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String nick = request.getParameter("nick");
		String email =request.getParameter("email");
		String title =request.getParameter("title");
		String content =request.getParameter("content");
		int number = Integer.parseInt(request.getParameter("number"));
		int date = Integer.parseInt(request.getParameter("date"));
		
		Notice1VO vo =new Notice1VO();
		Notice1DAO dao =new Notice1DAO();
		
				
	}

}
