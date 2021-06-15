package com.increpas.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.increpas.project.dao.SearchDao;
import com.increpas.project.vo.SearchVO;

/**
 * 
 * @author yujin
 * @since 2021.06.01
 * @version v.1.0
 */

@Controller
@RequestMapping("/movie")

public class Search {
	@Autowired
	SearchDao sDao;
	
	public boolean isLogin(HttpSession session) {
		String sid = (String) session.getAttribute("SID");
		
		return (sid == null) ? false : true;
	}
	
	// 검색결과 뷰 처리
	@RequestMapping("/searchList.proj")
	public ModelAndView getSearch(ModelAndView mv, RedirectView rv, HttpSession session ) {
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/project/member/login.proj");
			mv.setView(rv);
		}else {
		String view ="movie/searchList";
		mv.setViewName(view);
		}
		return mv;
	}
	
	// 검색 처리
	@RequestMapping("/searchProc.proj")
	public ModelAndView searchProc(SearchVO sVO,HttpSession session, ModelAndView mv, RedirectView rv) {

		String word = '%'+sVO.getSearch()+'%';
		List list = sDao.search(word);
		
		mv.addObject("LIST",list);
		mv.setViewName("movie/searchList");
		return mv;
	}
	

}
