package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.formDAO;
import com.smhrd.model.formVO;

public class formService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		String email = request.getParameter("email");
		String nick = request.getParameter("nick");
		String title = request.getParameter("title");
		String content =request.getParameter("content");
		
		
		formVO vo = new formVO(email, nick, title, content);
		formDAO dao= new formDAO();
		
		int cnt = dao.insert(vo);
		System.out.println(vo.toString());
		
		if (cnt > 0) {
			System.out.println("게시물등록 성공");
		} else {
			System.out.println("게시물등록 실패...");
		}
		
		response.sendRedirect("main.jsp");
		
	}

}
