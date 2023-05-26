package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.noticeDAO;
import com.smhrd.model.noticeVO;

public class notieBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String nick = request.getParameter("nick");
		String title= request.getParameter("title");
		String content = request.getParameter("content");
		int number = Integer.parseInt(request.getParameter("number"));
		int date = Integer.parseInt(request.getParameter("date"));
		
		
		noticeDAO nodao = new noticeDAO();
		noticeVO novo = new noticeVO(nick,title,content,number,date);
		
		List<noticeVO> cnt = nodao.boardList(novo);
		
		if(cnt == null) {
			System.out.println("연결 성공");
			
		}
		else {
			System.out.println("연결 실패");
		}
		response.sendRedirect("noticeBoard.jsp");
	}
		
	

}
