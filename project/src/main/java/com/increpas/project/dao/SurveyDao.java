package com.increpas.project.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;

import com.increpas.project.vo.*;

/**
 *  설문조사 관련 데이터베이스 작업 클래스
 * @author 윤건우
 * @since  2021.06.11
 * @version v.1.0
 * @see	
 * 			작업이력 ]
 * 						2021.06.11	-	담당자 : 윤건우
 * 										작업내용 : 클래스 제작
 * 													현재진행중인 설문 갯수 조회함수 추가
 *
 */
public class SurveyDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 현재 진행중인 설문조사 리스트 조회 전담 처리함수
	public List getList() {
		return sqlSession.selectList("sSQL.getList");
	}
	
	// 진행중인 설문조사 갯수 조회 전담 처리함수
	public int getCount() {
		return sqlSession.selectOne("sSQL.getCount");
	}
	
	// 설문문항 리스트 조회 전담 처리함수
	public List questList(int sino) {
		return sqlSession.selectList("sSQL.questList", sino);
	}
	
	// 로그인 회원 설문 참여 카운트 조회 처리함수
	public int answerCnt(SurveyVO sVO) {
		return sqlSession.selectOne("sSQL.answerCount", sVO);
	}
	
	// 설문보기 리스트 조회 전담 처리 함수
	public List exList(int qno) {
		return sqlSession.selectList("sSQL.exList", qno);
	}
	
	// 설문응답 추가 전담 처리함수
	public int insertAnswer(SurveyVO sVO) {
		return sqlSession.insert("sSQL.addAnswer", sVO);
	}
	
	// 설문 응답 결과 조회 처리함수
	public List getExResult(SurveyVO sVO) {
		return sqlSession.selectList("sSQL.resultEx", sVO);
	}
}
