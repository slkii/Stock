package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

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
	public  formVO formVO (String value){
		SqlSession session = sqlSessionFactory.openSession(true);
		formVO post = session.selectOne("selectPost",value);
		session.close();
		return post;
	}
	
//	public List<formVO> formVO (String value) {
//		SqlSession session = sqlSessionFactory.openSession(true);
//        List<formVO> list = session.selectList("selectPost",value);
//        session.close();
//        return (ArrayList<formVO>)list;
//    }

}
