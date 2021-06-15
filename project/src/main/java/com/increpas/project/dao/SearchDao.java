package com.increpas.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class SearchDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 검색어 처리
	public List search(String word) {
		return sqlSession.selectList("sSQL.search",word);
	}
}
