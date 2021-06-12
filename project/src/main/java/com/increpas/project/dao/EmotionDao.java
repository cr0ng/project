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


}
