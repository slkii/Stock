package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;
import com.smhrd.model.MemberVO;
import com.smhrd.model.Notice1DAO;
import com.smhrd.model.Notice1VO;


public class WritePost extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		
		String email = request.getParameter("email");
		String nick =request.getParameter("nick");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String date = request.getParameter("date");
		
		System.out.println(email+"ㅡㅡ"+nick+"ㅡㅡ"+title+"ㅡㅡ"+content+"ㅡㅡ"+date);
		
		Notice1VO vo =  new Notice1VO(email,nick,title,content,date);
		
		
		System.out.println(vo+"2020");
		Notice1DAO dao = new Notice1DAO();
		
		
		int cnt = dao.wirte(vo);
		
		if (cnt > 0) {
			System.out.println("작성성공");
		} else {
			System.out.println("작성 실패...");
		}
	}

}
