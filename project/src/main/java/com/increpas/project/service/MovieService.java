package com.increpas.project.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.increpas.project.dao.MovieDao;
import com.increpas.project.vo.MovieVO;

public class MovieService {
	
	@Autowired
	MovieDao moDao;
	/*
	public void insertMovieLike(MovieVO moVO) throws Exception {
		moDao.insertMovieLike(moVO);
		moDao.updateMovieLike(moVO.getMovie_num());
	}
	
	public void deleteMovieLike(MovieVO moVO) throws Exception {
		moDao.deleteMovieLike(moVO);
		moDao.updateMovieLike(moVO.getMovie_num());
	}
	
	public int getMovieLike(MovieVO moVO) throws Exception {
		return moDao.getMovieLike(moVO);
	}
	*/
}
