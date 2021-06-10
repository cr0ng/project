package com.increpas.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @author yujin
 *	@since 2021.06.09
 */

@Controller
@RequestMapping("/movie")

public class Emotion {

	// 감정 선택 페이지
	@RequestMapping(value="/emotion.proj")
	public String emotion() {
		
		
		return "movie/emotion";
	}
	
	// 감정별 영화 추천 페이지
	@RequestMapping(value="/recomovie.proj")
	public String recoMovie() {
		return "movie/recomovie";
	}
}
