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
}