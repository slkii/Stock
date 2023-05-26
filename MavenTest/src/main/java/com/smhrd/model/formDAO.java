package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;


public class formDAO {

	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	
//	게시물 등록 insert
	public int join(formVO vo) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("form", vo);
		session.close();
		return cnt;
	}
	
//게시물 불러오기 
	public  formVO selectPost (String seq){
		SqlSession session = sqlSessionFactory.openSession(true);
		formVO post = session.selectOne("selectPost",seq);
		session.close();
		return post;
	}
}
