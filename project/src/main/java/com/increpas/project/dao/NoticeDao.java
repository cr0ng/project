package com.increpas.project.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;

import com.increpas.project.util.*;
import com.increpas.project.vo.*;

/**
 *  이 클래스는 공지사항 관련 데이터베이스 작업을 전담 처리할 클래스
 * @author 윤건우
 * @since 	2021.06-07
 * @version v.1.0
 * @see	
 * 			작업이력 ]
 * 				2021.06.07	-	담당자		: 윤건우
 * 								작업내용	: 클래스제작, 총게시글 조회 처리
 *
 */
public class NoticeDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 총게시글 수 조회 전담 처리함수
	public int getTotal() {
		return sqlSession.selectOne("nSQL.totalCnt");
	}
	
	// 게시글 조회 전담 처리함수
	public List noticeList(PageUtil page) {
		return sqlSession.selectList("nSQL.noticeList", page);
	}
	
	// 게시글 작성 전담 처리함수
	public int noticeWrite(NoticeVO nVO) {
		return sqlSession.insert("nSQL.noticeWrite", nVO);
	}
	
	// 게시글 상세 정보 조회 전담 처리함수
	public NoticeVO noticeDetail(int notice_no) {
		return sqlSession.selectOne("nSQL.noticeDetail", notice_no);
	}
	
	// 게시글 수정 전담 처리함수
	public int noticeEdit(NoticeVO nVO) {
		return sqlSession.update("nSQL.noticeEdit", nVO);
	}
	
	// 게시글 삭제 전담 처리함수
	public int noticeDel(int notice_no) {
		return sqlSession.update("nSQL.noticeDel", notice_no);
	}
	
	// 조회수 전담 처리함수
	public int hitCount(int notice_no) {
		return sqlSession.update("nSQL.hitCount", notice_no);
	}
	
}
