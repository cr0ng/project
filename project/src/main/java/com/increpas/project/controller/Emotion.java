package com.increpas.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.increpas.project.dao.EmotionDao;
import com.increpas.project.vo.EmotionVO;

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

	// 감정 선택 페이지
	@RequestMapping("/emotion.proj")
	public ModelAndView emotion(ModelAndView mv) {
		mv.setViewName("movie/emotion");
		return mv;
	}

	
	  // 감정 선택시 추천 영화 처리
	  
	  @RequestMapping("/emoSelect.proj")
	  
	  @ResponseBody public ArrayList<EmotionVO> emoSelect(EmotionVO eVO) {
	  
	  int emo = eVO.getEmo(); System.out.println("******** emo : " + emo);
	  
	  ArrayList<EmotionVO> list = (ArrayList<EmotionVO>) eDao.recoMovie(eVO);
	  //System.out.println("************* list size : " + list.size());
	  //for(EmotionVO e : list){ System.out.println(e);}
	  return list; 
	  }
	
	  // 감정별 영화 추천 페이지
	  
	  @RequestMapping(value="/recomovie.proj") public String recoMovie() {
		  return "movie/recomovie"; 
	  }
	 
}
