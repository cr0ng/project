package com.increpas.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.increpas.project.dao.MemberDao;
import com.increpas.project.service.MemberService;
import com.increpas.project.vo.MemberVO;

/**
 * 
 * @author yujin
 * @since 2021.06.01
 * @version v.1.0
 */

@Controller
@RequestMapping("/member")

public class Member {
	@Autowired
	MemberDao mDao;
	@Autowired
	MemberService mSrvc;
	
	public boolean isLogin(HttpSession session) {
		String sid = (String) session.getAttribute("SID");
		
		return (sid == null) ? false : true;
	}
	
	// 로그인 페이지
	@RequestMapping("/login.proj")
	public ModelAndView Login(ModelAndView mv, RedirectView rv, HttpSession session) {
		 
		if(isLogin(session)) {
			rv.setUrl("/project/main.proj");
			mv.setView(rv);
		} else {
		 
			String view ="member/login";
			mv.setViewName(view);
			
		}
		
		return mv;
	}
	
	//로그인 처리
	@RequestMapping("/loginProc.proj")
	public ModelAndView loginProc(MemberVO mVO, ModelAndView mv, HttpSession session, RedirectView rv) {

		String view ="/project/movie/emotion.proj";
	
			if(!isLogin(session)) {
			int cnt = mDao.getLogin(mVO);
			if(cnt == 1) {
				session.setAttribute("SID", mVO.getUser_id());
			}else {
				view = "/project/member/login.proj";
			}
		}
		rv.setUrl(view);
		mv.setView(rv);
		return mv;
	}
	
	// 로그아웃 처리
	@RequestMapping("/logout.proj")
	public ModelAndView logout(HttpSession session, ModelAndView mv, RedirectView rv) {
		session.removeAttribute("SID");
		rv.setUrl("/project/member/login.proj");
		mv.setView(rv);
		return mv;
	}
		
	
	// 회원가입 페이지
	@RequestMapping(value="/join.proj")
	public String getJoin() {
		return "member/join";
	}
	
	// 아이디,비번찾기 페이지
	@RequestMapping("/findIDPW.proj")
	public ModelAndView findIDPW(ModelAndView mv,  RedirectView rv, HttpSession session) {
		String view ="member/findIDPW";
		
		mv.setViewName(view);
		return mv;
	}
	
	// 아이디 알려주는 페이지
	@RequestMapping("/findID.proj")
	public ModelAndView findID(ModelAndView mv,  RedirectView rv, HttpSession session) {
		String view ="member/findID";
		
		mv.setViewName(view);
		return mv;
	}

	// 아이디 찾기 처리
	@RequestMapping("/findIDProc.proj")
	public ModelAndView findIDProc(MemberVO mVO, ModelAndView mv, HttpSession session, RedirectView rv) {
		
		String id = mDao.findID(mVO);
		
		mv.addObject("ID", id);
		
		mv.setViewName("member/findID");
		return mv;
	}
	
	// 임시 비번 전송 알림 페이지
	@RequestMapping("/findPW.proj")
	public ModelAndView findPW(ModelAndView mv,  RedirectView rv, HttpSession session) {
		String view ="member/findPW";

		
		mv.setViewName(view);
		return mv;
	}
	
	// 임시 비밀번호 업데이트 처리
	@RequestMapping("/updatePWProc.proj")
	public ModelAndView updatePWProc(MemberVO mVO, ModelAndView mv, HttpSession session, RedirectView rv) {
		
		int cnt = mDao.emailCK(mVO.getEmail());
		
		mv.addObject("CNT",cnt);
		if(cnt == 1) {
			String pw = MemberService.sendMail(mVO);
			
			mVO.setUser_pw(pw);
			mDao.updatePW(mVO);
			
			System.out.println("임시 비밀번호 : " + pw);
		}
		mv.setViewName("member/findPW");
		return mv;
		
	}
	
}
