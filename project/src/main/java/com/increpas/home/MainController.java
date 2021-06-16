package com.increpas.home;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class MainController {
	
	public boolean isLogin(HttpSession session) {
		String sid = (String) session.getAttribute("SID");
		
		return (sid == null) ? false : true;
	}
	
	@RequestMapping("/")
	public ModelAndView getMain(ModelAndView mv, RedirectView rv, HttpSession session) {
		if(isLogin(session)) {
			rv.setUrl("/project/main.proj");
			mv.setView(rv);
		} else {
		 
			String view ="member/login";
			mv.setViewName(view);
			
		}
		return mv;
	}
}
