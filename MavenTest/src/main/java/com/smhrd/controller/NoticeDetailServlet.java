package com.smhrd.controller;

import java.io.IOException;
import java.io.Reader;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.smhrd.model.formVO;
import com.smhrd.model.noticeDAO;
import com.smhrd.model.noticeVO;

public class NoticeDetailServlet extends HttpServlet {
    private SqlSessionFactory sqlSessionFactory;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		noticeDAO dao = new noticeDAO();
		int number = Integer.parseInt(request.getParameter("number")); // 요청에서 공지사항 번호를 가져옵니다.
		noticeVO notice = dao.getNotice(number);

		// 가져온 noticeVO 객체를 요청 범위에 설정합니다.
		request.setAttribute("notice", notice);

		// JSP 페이지로 요청을 전달합니다.
		RequestDispatcher dispatcher = request.getRequestDispatcher("/noticeDetail.jsp");
		dispatcher.forward(request, response);
	}
}