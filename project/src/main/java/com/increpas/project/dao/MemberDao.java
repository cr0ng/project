package com.increpas.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.increpas.project.vo.MemberVO;

public class MemberDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 로그인 처리 함수
	public int getLogin(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.login",mVO);
	}
	
	// 아이디찾기 처리함수
	public String findID(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.findID",mVO);
	}
	
	// 비밀번호 업데이트 처리 함수
	public int updatePW(MemberVO mVO) {
		return sqlSession.update("mSQL.updatePW",mVO);
	}
	
	// 이메일 조회
	public int emailCK(String email) {
		return sqlSession.selectOne("mSQL.emailCK",email);
	}
	
}
