package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberVO;

public class LoginService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");

		String email = request.getParameter("email");
		String pw = request.getParameter("pw");

		System.out.println(email + "/" + pw);

		MemberVO vo = new MemberVO(email, pw);
		MemberDAO dao = new MemberDAO();

		// 로그인처리 (db에 값 있는지 확인) //-> 사용자 정보 가져와야함
		MemberVO loginVO = dao.login(vo);

		System.out.println(loginVO);

		// 로그인 성공인지 실패인지 판단
		if (loginVO != null) { // 성공
			System.out.println("로그인성공!");
			// 로그인 성공시 main 페이지에 사용자의 정보가 출력되게끔 하려면??
			// 세션에 사용자의 데이터 저장 .
			// 서블릿에서는 세션객체 생성 후 사용해야한다.
			HttpSession session = request.getSession();
			session.setAttribute("loginM", loginVO);
			response.sendRedirect("main.jsp");
		} else { // 실패
			System.out.println("로그인실패!");
			response.sendRedirect("error.jsp");
		}

	}

}