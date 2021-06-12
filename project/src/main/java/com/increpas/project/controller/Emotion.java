package com.increpas.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

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
		  
		  int emo = eVO.getEmo(); System.out.println("******** emo : " + emo);
		  System.out.println(sid);
		  ArrayList<EmotionVO> list = (ArrayList<EmotionVO>) eDao.recoMovie(eVO);
			/*
			 * eVO.setUser_id(sid); list.add(eVO);
			 */
		  for(EmotionVO e : list){ System.out.println(e);}
		//  int cnt = eDao.userEmo(sid);
		  return list; 
	  }
	 
}
