package com.increpas.project.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.increpas.project.dao.MovieDao;
import com.increpas.project.util.PageUtil;
import com.increpas.project.vo.MovieVO;

@Controller
@RequestMapping("/movie")
public class Movie {
	
	@Autowired
	MovieDao moDao;
	
	// 영화 리스트 보기 요청 처리함수
	@RequestMapping("/movieList.proj")
	public ModelAndView MovieList(HttpSession session, MovieVO moVO, PageUtil page, ModelAndView mv, RedirectView rv) {
		/*
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/project/member/login.proj");
			mv.setView(rv);
			return mv;
		}
		*/
//		System.out.println("############# movieList nowPage : " + page.getNowPage());
		int total = moDao.getTotal();
		
		page.setPage(page.getNowPage(), total, 6, 5);
		List list = moDao.movieList(page);
		
		List glist = moDao.genreList();
		mv.addObject("LIST", list);
		mv.addObject("GLIST", glist);
		mv.addObject("PAGE", page);
		
		mv.setViewName("movie/movieList");
		return mv;
	}
	
	// 영화 상세보기 요청 처리함수
	@RequestMapping("/movieDetail.proj")
	public ModelAndView movieDetail(PageUtil page, MovieVO moVO, ModelAndView mv, RedirectView rv) {
		
		MovieVO data = moDao.movieDetail(moVO.getMno());
		List rlist = moDao.getReviewList(moVO.getMno());
		List list = moDao.genreMovieDetail(moVO);
		List glist = moDao.genreList();
		System.out.println("##### rlist " + rlist.size());
		System.out.println("##### mno " + moVO.getMno());
		System.out.println("##### movie_num" + moVO.getMno());
		System.out.println("##### glist : " + glist.size());
		
		mv.addObject("DATA", data);
		mv.addObject("RLIST", rlist);
		
		mv.addObject("GLIST", glist);
		mv.addObject("LIST", list);

		mv.addObject("GNO", moVO.getGnum());
		mv.setViewName("movie/movieDetail");
		return mv;
	}
	
	// 영화 장르별 상세보기 요청처리함수
	@RequestMapping("/genreList.proj")
	public ModelAndView genreMovieDetail(PageUtil page, MovieVO moVO, ModelAndView mv) {
		
		int total = moDao.getGTotal(moVO.getGnum());
		
		page.setPage(total, 6, 5);
		
//		int nowPage = page.getNowPage();
		moVO.setPage(page);
		moVO.setStartCont(page.getStartCont());
		moVO.setEndCont(page.getEndCont());
		List glist = moDao.genreList();
		
//		System.out.println("***** genreMovieDetail page : " + page);
//		System.out.println("***** moVO.gnum : " + moVO.getGnum());
//		System.out.println(glist.size());

		List list = moDao.genreMovieDetail(moVO);
		mv.addObject("LIST", list);
		mv.addObject("GLIST", glist);
		mv.addObject("PAGE", page);
		mv.addObject("GNO", moVO.getGnum());

		mv.setViewName("movie/genreList");
		return mv;
	}
	/*
	 
	@RequestMapping("/reviewList.proj")
	public ModelAndView reviewList(ModelAndView mv, HttpSession session) {
		List list = moDao.getAllList();
		
		String sid = (String) session.getAttribute("SID");
		if(sid != null) {
			int cnt = moDao.getReviewCount(sid);
			mv.addObject("CNT", cnt);
		}
		mv.addObject("LIST", list);
		mv.setViewName("movie/reviewList");
		return mv;
	}
	 */
	// 리뷰쓰기 폼보기 요청 처리함수
	@RequestMapping("/reviewWrite.proj")
	public ModelAndView reviewWrite(ModelAndView mv, HttpSession session, RedirectView rv) {

		session.setAttribute("SID", "chaewon");
		
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/project/member/login.proj");
			mv.setView(rv);
			return mv;
		}
		
		MovieVO moVO = moDao.writerInfo(sid);
		moVO.setUser_id("chaewon");				// delete
		mv.addObject("DATA", moVO);
		mv.setViewName("movie/movieDetail.proj");
		return mv;
	}
	
	// 리뷰 글 등록 요청처리함수
	@RequestMapping("/reviewWriteProc.proj")
	public ModelAndView addReview(MovieVO moVO, ModelAndView mv, HttpSession session, RedirectView rv) {

		session.setAttribute("SID", "chaewon");	// delete
		moVO.setUser_id("chaewon");				// delete
		
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/project/member/login.proj");
			mv.setView(rv);
			return mv;
		}
		
		System.out.println("*********** VO :\n" + moVO);
		int cnt = moDao.addReview(moVO);
		System.out.println("######### cnt : " + cnt);
		if(cnt == 1) {
			rv.setUrl("/project/movie/movieDetail.proj?mno="+moVO.getMno());
		} else {
			rv.setUrl("/project/movie/reviewWrite.proj?mno="+moVO.getMno());
		}
		mv.setView(rv);
		return mv;
	}
	
	// 리뷰 수정 처리 요청 
	@RequestMapping("/reviewEditProc.proj")
	public ModelAndView editReview(MovieVO moVO, ModelAndView mv, HttpSession session, RedirectView rv) {
		
		session.setAttribute("SID", "chaewon");
		moVO.setUser_id("chaewon");
		
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/project/member/login.proj");
			mv.setView(rv);
			return mv;
		}
		int cnt = moDao.editProc(moVO);
		if(cnt != 1) {
			mv.addObject("MSG", " 수정 처리 실패");
		} else {
			mv.addObject("MSG", moVO.getMember_num() + " 님 글 수정처리 성공");
		}
		System.out.println("#####################edit cnt" + cnt);
		
		mv.addObject("PATH", "/project/movie/movieDetail.proj");
		mv.setViewName("movie/redirectView");
		return mv;
	}
	
	
}
