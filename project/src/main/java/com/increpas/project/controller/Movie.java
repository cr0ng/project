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
import org.springframework.web.bind.annotation.ResponseBody;
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
	
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/project/member/login.proj");
			mv.setView(rv);
			return mv;
		}
	
		int total = moDao.getTotal();
		MovieVO data = moDao.movieDetail(moVO.getMno());

		page.setPage(page.getNowPage(), total, 6, 5);
		moVO.setStartCont(page.getStartCont());
		moVO.setEndCont(page.getEndCont());
		moVO.setUser_id(sid);
		
		int cnt = moDao.getReviewCnt(moVO.getMno());

		List hlist = moDao.getHeartList(moVO);
		mv.addObject("HLIST", hlist);
		List glist = moDao.genreList();
		mv.addObject("DATA", data);

		mv.addObject("GLIST", glist);
		mv.addObject("PAGE", page);
		mv.addObject("CNT", cnt);
		
		
		mv.setViewName("movie/movieList");
		return mv;
	}
	// 찜하기 요청 처리함수
	@RequestMapping("/addHeartProc.proj")
	@ResponseBody
	public MovieVO addHeart(MovieVO moVO) {
		int cnt = 0 ;
		if(moVO.getShowcode().equals("E")) {
			cnt = moDao.addHeart(moVO);
		} else if(!(moVO.getShowcode().equals("E"))){
			cnt =  moDao.updateHeart(moVO);
		} 
		
		if(cnt == 1) {
			moVO.setResult("OK");
		} else {
			moVO.setResult("NO");
		}
		
		return moVO;
		
	}
	// 영화 상세보기 요청 처리함수
	@RequestMapping("/movieDetail.proj")
	public ModelAndView movieDetail(PageUtil page, MovieVO moVO, HttpSession session, ModelAndView mv, RedirectView rv) {
		
		MovieVO data = moDao.movieDetail(moVO.getMno());
		List<MovieVO> rlist = moDao.getReviewList(moVO.getMno());
		List list = moDao.genreMovieDetail(moVO);
		List glist = moDao.genreList();
		List p1list = moDao.platform1(moVO.getMno());
		List p2list = moDao.platform2(moVO.getMno());
		List p3list = moDao.platform3(moVO.getMno());
		List ost = moDao.ost(moVO.getMno());
		int cnt = moDao.getReviewCnt(moVO.getMno());
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/project/member/login.proj");
			mv.setView(rv);
			return mv;
		}		
		moVO.setUser_id(sid);
		List hlist = moDao.getHeartList(moVO);
		mv.addObject("HLIST", hlist);
		
		mv.addObject("DATA", data);
		mv.addObject("RLIST", rlist);
		
		mv.addObject("GLIST", glist);
		mv.addObject("LIST", list);
		mv.addObject("P1LIST", p1list);
		mv.addObject("P2LIST", p2list);
		mv.addObject("P3LIST", p3list);
		mv.addObject("OST", ost);
		mv.addObject("PAGE", page);

		mv.addObject("GNO", moVO.getGnum());
		mv.addObject("CNT", cnt);
		mv.setViewName("movie/movieDetail");
		return mv;
	}
	
	// 영화 장르별 상세보기 요청처리함수
	@RequestMapping("/genreList.proj")
	public ModelAndView genreMovieDetail(PageUtil page, MovieVO moVO, ModelAndView mv, HttpSession session) {
		String sid = (String) session.getAttribute("SID");
		moVO.setUser_id(sid);

		int nowPage = page.getNowPage();
		if(nowPage == 0) {
			nowPage = 1;
		}

		int total = moDao.getGTotal(moVO.getGnum());
		
		page.setPage(nowPage, total, 6, 5);
		
		moVO.setPage(page);
		moVO.setStartCont(page.getStartCont());
		moVO.setEndCont(page.getEndCont());
		List glist = moDao.genreList();
		List list = moDao.genreMovieDetail(moVO);
		List hlist = moDao.getHeartList(moVO);
		mv.addObject("HLIST", hlist);
		mv.addObject("LIST", list);
		mv.addObject("GLIST", glist);
		mv.addObject("PAGE", page);
		mv.addObject("GNO", moVO.getGnum());

		mv.setViewName("movie/genreList");
		return mv;
	}
	
	/*
	// 회원번호로 찜한 영화보기
	@RequestMapping("/mnoLikeMovie.proj")
	public ModelAndView mnoLikeMovie(MovieVO moVO, ModelAndView mv, HttpSession session, RedirectView rv) {
		
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/project/member/login.proj");
			mv.setView(rv);
			return mv;
		}
		
		List list = moDao.genreMovieDetail(moVO);
		mv.addObject("LIST", list);
		mv.setViewName("movie/movieList");
		return mv;
	}
	 
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
		
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/project/member/login.proj");
			mv.setView(rv);
			return mv;
		}
		
		MovieVO moVO = moDao.writerInfo(sid);
		mv.addObject("DATA", moVO);
		mv.setViewName("movie/movieDetail");
		return mv;
	}
	
	// 리뷰 글 등록 요청처리함수
	@RequestMapping("/reviewWriteProc.proj")
	public ModelAndView addReview(MovieVO moVO, ModelAndView mv, HttpSession session, RedirectView rv) {
		
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/project/member/login.proj");
			mv.setView(rv);
			return mv;
		}
		moVO.setUser_id(sid);
		int cnt = moDao.addReview(moVO);
		if(cnt == 1) {
			rv.setUrl("/project/movie/movieDetail.proj?mno="+moVO.getMno());
		} else {
			rv.setUrl("/project/movie/reviewWrite.proj?mno="+moVO.getMno());
		}
		mv.setView(rv);
		return mv;
	}
	// 리뷰 폼 보기 요청처리함수 
	@RequestMapping("/reviewEdit.proj")
	public ModelAndView editReview(String user_id, ModelAndView mv, HttpSession session, RedirectView rv) {
		
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/project/member/login.proj");
			mv.setView(rv);
			return mv;
		}
		
		MovieVO moVO = moDao.getEditData(user_id);
		
		mv.addObject("DATA", moVO);
		mv.setViewName("movie/movieDetail");
		return mv;
		
	}
	// 리뷰 수정 처리 요청 
	@RequestMapping("/reviewEditProc.proj")
	public ModelAndView editReviewProc(MovieVO moVO, ModelAndView mv, HttpSession session, RedirectView rv) {
		
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
			mv.addObject("MSG", moVO.getUser_id() + " 님 글 수정처리 성공");
		}
		
		mv.addObject("MNO", moVO.getMovie_num());
		mv.addObject("PATH", "/project/movie/movieDetail.proj");
		mv.setViewName("movie/redirectView");
		
		return mv;
	}
	
}
