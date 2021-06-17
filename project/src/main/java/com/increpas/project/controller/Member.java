package com.increpas.project.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.increpas.project.dao.MemberDao;
import com.increpas.project.service.MemberService;
import com.increpas.project.vo.MemberVO;

/**
 * 
 * @author 김유진, 윤건우
 * @since 2021.06.01 ~ 02
 * @version v.1.0
 * @see
 *          작업이력 ]
 *                2021/06/01   -   담당자      :   김유진
 *                            작업내용   :   로그인, 로그아웃, 아이디/비밀번호 찾기
 *
 *                2021/06/02   -   담당자      :   윤건우
 *                            작업내용   :   회원가입, 내정보 조회/수정
 */


@Controller
@RequestMapping("/member")

public class Member {
	@Autowired
	MemberDao mDao;
	@Autowired
	MemberService mSrvc;
	
	private static final Logger logger = LoggerFactory.getLogger(Member.class);
	
	public boolean isLogin(HttpSession session) {
		String sid = (String) session.getAttribute("SID");
		
		return (sid == null) ? false : true;
	}
	
	//김유진
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
			mVO.setCnt(cnt);
			
			if(cnt == 1) {
				session.setAttribute("SID", mVO.getUser_id());
				logger.info("** " + mVO.getUser_id() + "님 로그인 **");
			}else {
				logger.info("** 로그인 실패 **");
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
		logger.info("** 로그아웃 **");
		session.removeAttribute("SID");
		rv.setUrl("/project/member/login.proj");
		mv.setView(rv);
		return mv;
	}
	
	// 아이디,비번찾기 페이지
	@RequestMapping("/findIDPW.proj")
	public ModelAndView findIDPW(ModelAndView mv) {
		String view ="/member/findIDPW";
		
		mv.setViewName(view);
		return mv;
	}
	
	// 아이디 알려주는 페이지
	@RequestMapping("/findID.proj")
	public ModelAndView findID(ModelAndView mv) {
		String view ="member/findID";
		
		mv.setViewName(view);
		return mv;
	}

	// 아이디 찾기 처리
	@RequestMapping("/findIDProc.proj")
	public ModelAndView findIDProc(MemberVO mVO, ModelAndView mv) {
		
		String id = mDao.findID(mVO);
		
		mv.addObject("ID", id);
		
		mv.setViewName("member/findID");
		return mv;
	}
	
	// 임시 비번 전송 알림 페이지
	@RequestMapping("/findPW.proj")
	public ModelAndView findPW(ModelAndView mv) {
		String view ="member/findPW";

		
		mv.setViewName(view);
		return mv;
	}
	
	// 임시 비밀번호 업데이트 처리
	@RequestMapping("/updatePWProc.proj")
	public ModelAndView updatePWProc(MemberVO mVO, ModelAndView mv) {
		
		int cnt = mDao.emailCK(mVO.getEmail());
		
		mv.addObject("CNT",cnt);
		if(cnt == 1) {
			String pw = MemberService.sendMail(mVO);
			
			mVO.setUser_pw(pw);
			mDao.updatePW(mVO);
			
		}
		mv.setViewName("member/findPW");
		return mv;
		
	}
	
	
	//윤건우
	@RequestMapping("/join.proj")
	   public ModelAndView join(ModelAndView mv, HttpSession session, RedirectView rv) {
	      // 로그인 검사
	      if(isLogin(session)) {
	         rv.setUrl("/project/main.proj");
	         mv.setView(rv);

	         // 반환하고 함수 실행 종료
	         return mv;
	      }
	      
	      String view = "member/join";
	      
	      mv.setViewName(view);
	      return mv;
	   }
	   
	   @RequestMapping("/joinProc.proj")
	   public ModelAndView joinProc(MemberVO mVO, ModelAndView mv, HttpSession session, RedirectView rv) {
	      // 로그인 검사하고
	      if(isLogin(session)) {
	         rv.setUrl("/project/main.proj");
	         mv.setView(rv);
	         return mv;
	      }
	      
	      int cnt = mDao.addMember(mVO);
	      if(cnt == 1) {
	         //session.setAttribute("SID", mVO.getUser_id());
	         rv.setUrl("/project/member/login.proj");
	      } else {
	         rv.setUrl("/project/member/join.proj");
	      }
	      mv.setView(rv);
	      return mv;
	      
	      // 반환하고 함수 실행 종료하고
	   }

	   /*
	       회원가입 아이디체크 요청 처리
	    */
	   @RequestMapping(value="/idCheck.proj", method=RequestMethod.POST, params="id")
	   @ResponseBody
	   public HashMap<String, String> idCheck(String id){
	      int cnt = mDao.getIdCnt(id);
	      
	      HashMap<String, String> map = new HashMap<String, String>();
	      map.put("reslt", "NO");
	      map.put("id", id);
	      if(cnt != 1) {
	         map.put("result", "OK");
	      }
	      
	      return map;
	   }
	   /*
	       내 정보보기 요청 처리
	    */
	   @RequestMapping("/myPage.proj")
	   public ModelAndView myPage(ModelAndView mv, HttpSession session, RedirectView rv) {
	      // 할일
	      // 로그인 검사
	      if(isLogin(session)) {
	         // 아이디 꺼내오고
	         String sid = (String) session.getAttribute("SID");
	         // 데이터베이스 작업하고
	         MemberVO mVO = mDao.getMyPage(sid);
	         // 만들어진 데이터 뷰에 보내고
	         mv.addObject("DATA", mVO);
	         // 뷰 정하고
	         mv.setViewName("member/myPage");
	      } else {
	         // 로그인 안한경우 로그인페이지로 돌려보낸다
	         rv.setUrl("member/login.proj");
	         mv.setView(rv);
	      }
	      // 반환값 반환하고
	      return mv;
	   }
	   
	   /*
	       정보 수정 요청 처리
	    */
	   @RequestMapping("/editInfo.proj")
	   public ModelAndView eidtInfo(ModelAndView mv, HttpSession session, RedirectView rv) {
	      // 로그인 검사하고
	      if(!isLogin(session)) {
	         rv.setUrl("/project/member/login.proj");
	         mv.setView(rv);
	         // 반환하고 함수 실행 종료하고
	         return mv;
	      }
	      // 아이디 꺼내고
	      String sid = (String)session.getAttribute("SID");
	      // 데이터베이스 조회하고
	      MemberVO mVO = mDao.getMyPage(sid);
	      // 데이터베이스 뷰에 심고
	      mv.addObject("DATA", mVO);
	      // 뷰 부르고
	      mv.setViewName("member/editInfo");
	      // 데이터반환하고
	      return mv;
	   }
	   
	   /*
	       내 정보 수정 처리 요청 처리함수
	    */
	   @RequestMapping("/editInfoProc.proj")
	   public ModelAndView editInfoProc(MemberVO mVO, ModelAndView mv, HttpSession session, RedirectView rv) {
	      
	      // 로그인 검사하고
	      if(!isLogin(session)) {
	         rv.setUrl("/project/member/login.proj");
	         mv.setView(rv);
	         
	         return mv;
	      }
	      
	      int cnt = mDao.editInfo(mVO);
	      String view = "/project/member/myPage.proj";
	      if(cnt != 1) {
	         view = "/project/member/editInfo.proj";
	      }
	      rv.setUrl(view);
	      mv.setView(rv);
	      // 반환하고 함수 실행 종료하고
	      return mv;
	   }

}
