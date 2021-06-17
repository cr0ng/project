package com.increpas.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.increpas.project.util.PageUtil;
import com.increpas.project.vo.MovieVO;

public class MovieDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 총 영화수 조회 전담처리함수
	public int getTotal() {
		return sqlSession.selectOne("moSQL.totalCnt");
	}
	
	// 영화리스트 조회 전담처리함수
	public List movieList(PageUtil page) {
		return sqlSession.selectList("moSQL.movieList", page);
	}
	
	// 영화 상세정보 조회 전담처리함수
	public MovieVO movieDetail(int mno) {
		return sqlSession.selectOne("moSQL.movieDetail", mno);
	}
	
	// 장르 총 개수
	public int getGTotal() {
		return sqlSession.selectOne("moSQL.gtotalCnt");
	}
	
	// 장르 리스트 조회 전담처리함수
	public List genreList() {
		return sqlSession.selectList("moSQL.genreList");
	}
	
	// 장르번호 별 영화정보보기 전담처리함수
	public List genreMovieInfo(int gnum) {
		return sqlSession.selectList("moSQL.genreMovieInfo", gnum);
	}
	
	// 영화 장르별 총 개수 조회 전담처리함수
	public int getGTotal(int gno) {
		return sqlSession.selectOne("moSQL.genreMovieTotal", gno);
	}
	
	// 영화 장르별 상세보기 전담처리함수
	public List genreMovieDetail(MovieVO moVO) {
		return sqlSession.selectList("moSQL.genreMovieDetail", moVO);
	}
	
	// 회원 아이디에 따른 찜한 영화보기처리함수
	public List heartMovieID(MovieVO moVO) {
		return sqlSession.selectList("moSQL.heartMovieID", moVO);
	}
	
	// 찜한 영화와 안한 영화리스트 조회전담처리함수
	public MovieVO heartAllMovies(MovieVO moVO) {
		return sqlSession.selectOne("moSQL.heartAllMovies", moVO);
	}
	
	// 찜하기 기능 영화 리스트 조회 전담처리함수
	public List getHeartList(MovieVO moVO) {
		return sqlSession.selectList("moSQL.getHeartList", moVO);
	}
	
	// 찜 등록 처리 전담함수
	public int addHeart(MovieVO moVO) {
		return sqlSession.insert("moSQL.addHeart", moVO);
	}
	// 찜하기 업데이트 처리 전담함수
	public int updateHeart(MovieVO moVO) {
		return sqlSession.update("moSQL.updateHeart", moVO);
	}
	
	// 리뷰 게시글 리스트 조회 전담처리함수
	public List getReviewList(int mno) {
		return sqlSession.selectList("moSQL.reviewMOList", mno);
	}
	// 리뷰 작성글 개수 조회 전담 처리함수 
	public int getReviewCount(String user_id) {
		return sqlSession.selectOne("moSQL.getReviewCount", user_id);
	}
	// 리뷰 수 조회 전담 처리함수
	public int getReviewCnt(int movie_num) {
		return sqlSession.selectOne("moSQL.getReviewCnt", movie_num);
	}
	// 작성자 정보 조회 전담 처리함수
	public MovieVO writerInfo(String user_id) {
		return sqlSession.selectOne("moSQL.writerInfo", user_id);
	}
	
	// 리뷰 등록 전담 처리함수
	public int addReview(MovieVO moVO) {
		return sqlSession.insert("moSQL.addReview", moVO);
	}
	
	// 리뷰 수정 데이터 조회 전담처리함수
	public MovieVO getEditData(String user_id) {
		return sqlSession.selectOne("moSQL.editReview", user_id);
	}
	
	// 리뷰 수정 처리 전담처리함수
	public int editProc(MovieVO moVO) {
		return sqlSession.update("moSQL.editProc", moVO);
	}
	
	// 플랫폼 별 영화 조회 질의명령 
	public List platform1(int mno) {
		return sqlSession.selectList("moSQL.platform1", mno);
	}
	
	// 플랫폼 별 영화 조회 질의명령 
	public List platform2(int mno) {
		return sqlSession.selectList("moSQL.platform2", mno);
	}
	
	// 플랫폼 별 영화 조회 질의명령 
	public List platform3(int mno) {
		return sqlSession.selectList("moSQL.platform3", mno);
	}
	
	// 영화 ost 조회 질의명령
	public List ost(int mno) {
		return sqlSession.selectList("moSQL.ost", mno);
	}
}
