package com.increpas.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.increpas.project.vo.EmotionVO;

public class EmotionDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 감정 선택 시 상위 영화 4개 보여주기
	public List recoMovie(EmotionVO eVO) {
		return sqlSession.selectList("eSQL.recoMovie", eVO);
	}

	// 감정 선택시 로그인한 유저의 감정 카운트 + 1
	public int memberEmoCnt(EmotionVO eVO) {
		return sqlSession.update("eSQL.memberEmoCnt",eVO);
	}

	// 감정 선택 후 선택한 영화 감정 카운트 + 1
	public int movieEmoCnt(EmotionVO eVO) {
		return sqlSession.update("eSQL.movieEmoCnt",eVO);
	}
}
