package com.increpas.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.increpas.project.vo.MemberVO;

/**
 * 
 * @author 김유진, 윤건우
 * @since 2021.06.01 ~ 02
 * @version v.1.0
 * @see
 *          작업이력 ]
 *                2021/06/01   -   담당자      :   김유진
 *                            작업내용   :   로그인, 아이디/비밀번호 찾기
 *
 *                2021/06/02   -   담당자      :   윤건우
 *                            작업내용   :   회원가입, 내정보 조회/수정
 */


public class MemberDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//김유진
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
	
	
	//윤건우
	 public int getIdCnt(String sid) {
	      return sqlSession.selectOne("mSQL.idCheck", sid);
	   }
	   

	   // 회원정보 입력 전담 처리함수
	   public int addMember(MemberVO mVO) {
	      return sqlSession.insert("mSQL.addMember", mVO);
	   }
	   
	   // 내 정보 조회 전담 처리 함수
	   public MemberVO getMyPage(String id) {
	      return sqlSession.selectOne("mSQL.myPage", id);
	   }
	   
	   // 내 정보 수정 전담 처리 함수
	   public int editInfo(MemberVO mVO) {
	      return sqlSession.insert("mSQL.editInfo", mVO);
	   }

	
}
