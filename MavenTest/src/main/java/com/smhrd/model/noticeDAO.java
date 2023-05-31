package com.smhrd.model;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;

import java.io.Reader;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.smhrd.db.SqlSessionManager;

public class noticeDAO {

	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// noticeList 붑러오기
	public List<noticeVO> boardList(noticeVO novo) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<noticeVO> boardList = session.selectList("list");
		session.close();
		return boardList;
	}

	// 글 내용 보기
	public List<noticeVO> boardNotice(int number) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<noticeVO> boardNotice = session.selectOne("boardNotice", number);
		session.close();
		return boardNotice;

	}

	public int join(noticeVO vo) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("boardList", vo);
		session.close();
		return cnt;
	}

	public noticeVO getNotice(int number) {
        SqlSession session = sqlSessionFactory.openSession(true);
        noticeVO vo = session.selectOne("getNotice", number);
        session.close();
        return vo;
    }
	
}
