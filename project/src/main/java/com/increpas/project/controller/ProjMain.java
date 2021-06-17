package com.increpas.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * @author yujin
 * @since 2021.06.02
 */
@Controller
public class ProjMain {
	
	// 메인(검색) 페이지
	@RequestMapping("/main.proj")
	public ModelAndView getMain(ModelAndView mv) {
		
		
		mv.setViewName("main");
		return mv;
	}
}

