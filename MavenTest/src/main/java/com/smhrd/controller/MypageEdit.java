package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberVO;

public class MypageEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("UTF-8");
		
		String email =request.getParameter("email");
		String nick =request.getParameter("nick");
		String pw =request.getParameter("pw");
		String tel = request.getParameter("tel");
		String addr = request.getParameter("addr");
		System.out.println(email+pw+tel+addr);
		
		MemberVO vo = new MemberVO(email,nick,pw,tel,addr);
		
		System.out.println(vo.toString());  // 값 확인용
		MemberDAO dao = new MemberDAO();  // 업데이트
		int cnt =  dao.update(vo);
		
		if (cnt>0) {
			System.out.println("회원정보 수정 성공!!");
			// 메인 이동 전 세션 값 수정해야함 . 
			HttpSession sesssion = request.getSession();
			//session 값으 수정하는 메서드는 존재 x 세션을 새로 생성해줘야함. 
			sesssion.setAttribute("loginM", vo);
			//main으로이동 
			response.sendRedirect("main.jsp");
		} else {
			System.out.println("회원정보 수정 실패 .. ");
			response.sendRedirect("update.jsp");
		}
		System.out.println(cnt);
	}

}

