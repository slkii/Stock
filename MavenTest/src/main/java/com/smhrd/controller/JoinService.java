package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberVO;

public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String email = request.getParameter("email");
		String nick = request.getParameter("nick");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String addr = request.getParameter("addr");

		MemberVO vo = new MemberVO(email, nick, pw, tel, addr);

		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(vo);

		if (cnt > 0) {
			System.out.println("회원가입 성공");
		} else {
			System.out.println("회원가입 실패...");
		}

		response.sendRedirect("Login.jsp");
	}

}
