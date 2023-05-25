package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class MemberDAO {

	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int join(MemberVO vo) {
		// TODO Auto-generated method stub
		// SqlSessionFactory에서 Connection(SqlSession) 하나 빌려오기
		// 매개변수 : true -> auto commit
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("join", vo);
		session.close();
		return cnt;
	}
	public MemberVO login(MemberVO vo) {
		// 데이터 확인 후 반환 / 확인한 데이터 (이메일,패스워드)
		// **selectOne : 하나의 값만 확인하고 반환 // ** 주의: db값 확인 했을 때 같은값 여러개이면 오류발생.
		SqlSession session = sqlSessionFactory.openSession(true);
		MemberVO loginVO = session.selectOne("login", vo);
		session.close(); // 쓸모없는 자원 사용되기때문에 세션 클로즈 해주기.
		return loginVO;
	}
	public int update(MemberVO vo) {
		// vo안에 있는 email을 기준으로 pw tel addr 를 수정하고 수정결과 return
		// 수정성공 시 return값 1 , 실패시 return 0
		SqlSession session = sqlSessionFactory.openSession(true);
		System.out.println(session);
		System.out.println(vo.toString());
		int cnt = session.update("update",vo);
		System.out.println(cnt);
		session.close();
		
		return cnt;		
	}
}