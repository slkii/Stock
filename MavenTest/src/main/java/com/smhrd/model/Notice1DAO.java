package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class Notice1DAO {
	
	private SqlSessionFactory sqlSessionFactory =SqlSessionManager.getSqlSession();
	
	public int wirte (Notice1VO vo) {
		SqlSession session= sqlSessionFactory.openSession(true); //세션 하나 빌려오기,세션오픈
		int cnt = session.insert("write",vo);
		session.close();
		return cnt;
	}

}
