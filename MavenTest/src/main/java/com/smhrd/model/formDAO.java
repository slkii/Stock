package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;


public class formDAO {

	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	
//	게시물 등록 insert
	public int insert(formVO vo) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("insert", vo);
		System.out.println(cnt);
		session.close();
		return cnt;
	}
	
//게시물 불러오기 
	public  formVO selectPost (String number){
		SqlSession session = sqlSessionFactory.openSession(true);
		formVO post = session.selectOne("selectPost",number);
		session.close();
		return post;
	}
}
