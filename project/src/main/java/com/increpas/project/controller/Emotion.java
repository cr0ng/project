package com.increpas.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.increpas.project.dao.EmotionDao;
import com.increpas.project.dao.MovieDao;
import com.increpas.project.util.PageUtil;
import com.increpas.project.vo.EmotionVO;
import com.increpas.project.vo.MovieVO;

/**
 * 
 * @author yujin
 * @since 2021.06.09
 */

@Controller
@RequestMapping("/movie")

public class Emotion {
	@Autowired
	EmotionDao eDao;
	@Autowired
	MovieDao moDao;

	// 감정 선택 페이지
		@RequestMapping("/emotion.proj")
		public ModelAndView emotion(ModelAndView mv, HttpSession session, RedirectView rv) {
			String sid = (String) session.getAttribute("SID");
			if(sid == null) {
				rv.setUrl("/project/member/login.proj");
			mv.setView(rv);
			return mv;
			}
			
			mv.setViewName("movie/emotion");
			return mv;
		}

	
	  // 감정 선택시 추천 영화 처리
	  @RequestMapping("/emoSelect.proj")
	  @ResponseBody public ArrayList<EmotionVO> emoSelect(EmotionVO eVO, HttpSession session) {
		  String sid = (String) session.getAttribute("SID");
		  
		  int emo = eVO.getEmo(); 
		  
		  eVO.setUser_id(sid);
		  // 로그인 한 유저의 감정 카운트 업데이트
		  int cnt = eDao.memberEmoCnt(eVO);
		 
		  ArrayList<EmotionVO> list = (ArrayList<EmotionVO>) eDao.recoMovie(eVO);
		
		  return list; 
	  }
	  
	  // 추천 영화 선택 시 영화 감정 카운트 업데이트, 영화 상세보기
	  @RequestMapping("/SelectDetail.proj")
		public ModelAndView movieDetail(EmotionVO eVO, MovieVO moVO, ModelAndView mv) {
			
		  int emo = eVO.getEmo(); 
		  
		  int mno = moVO.getMno();
		  eVO.setEmno(mno);
		  
		  int cnt = eDao.movieEmoCnt(eVO);
		  if(cnt == 1) {
			MovieVO data = moDao.movieDetail(moVO.getMno());
			List rlist = moDao.getReviewList(moVO.getMno());
			List list = moDao.genreMovieDetail(moVO);
			List glist = moDao.genreList();
			
			mv.addObject("DATA", data);
			mv.addObject("RLIST", rlist);
			
			mv.addObject("GLIST", glist);
			mv.addObject("LIST", list);

			mv.addObject("GNO", moVO.getGnum());
			mv.setViewName("movie/movieDetail");
		  } 
		  return mv;
		}
	 
}
