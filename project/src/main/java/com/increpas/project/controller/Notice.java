package com.increpas.project.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.view.*;

import com.increpas.project.dao.*;
import com.increpas.project.util.*;
import com.increpas.project.vo.*;

/**
 * 	공지사항 관련 요청 처리 클래스
 * @author 윤건우
 * @since  2021-06-07
 * @version v.1.0
 * @see
 * 			작업이력 ]
 * 					2021/06/07	-	담당자		:	윤건우
 * 									작업내용	:	클래스제작
 * 													공지사항 요청 함수 제작
 *
 */

@Controller
@RequestMapping("/notice")
public class Notice {
	@Autowired
	NoticeDao nDao;
	
	// 공지사항 리스트 보기 요청 처리함수
	@RequestMapping("/noticeList.proj")
	public ModelAndView noticeList(PageUtil page, ModelAndView mv) {
		int total = nDao.getTotal();
		
		// 데이터 만들고
		page.setPage(page.getNowPage(), total, 5, 5);
		
		List list = nDao.noticeList(page);
		
		
		for(Object o : list) {
			NoticeVO nVO = (NoticeVO) o;
			nVO.setReg_date(nVO.getReg_date());
		}
		
		// 데이터 전달하고
		mv.addObject("PAGE", page);
		mv.addObject("LIST", list);
		// 뷰 셋팅하고
		mv.setViewName("notice/noticeList");
		// 반환값 반환해주고
		return mv;
	}
	
	// 공지사항 작성 요청 처리함수
	@RequestMapping("/noticeWrite.proj")
	public ModelAndView noticeWrite(ModelAndView mv, HttpSession session, RedirectView rv) {
		// 할일
		// 1. 로그인 검사하고
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/project/member/login.proj");
			mv.setView(rv);
		} else if(!sid.equals("admin")) {
			rv.setUrl("/project/notice/noticeList.proj");
			mv.setView(rv);
			return mv;
		}
		// 2. 뷰 셋팅하고
		mv.setViewName("notice/noticeWrite");
		// 3. 반환값 반환하고
		return mv;
	}
	
	// 공지사항 등록 요청 처리함수
	@RequestMapping("/noticeWriteProc.proj")
	public ModelAndView noticeWriteProc(NoticeVO nVO,ModelAndView mv, HttpSession session, RedirectView rv) {
		// 할일
		// 1. 로그인 검사하고
		String sid = (String) session.getAttribute("SID");
		if(sid == null ) {
			rv.setUrl("/project/member/login.proj");
			mv.setView(rv);
			return mv;
		} else if(!sid.equals("admin")) {
			rv.setUrl("/project/notice/noticeList.proj");
			mv.setView(rv);
			return mv;
		}
		
		// 2. 작성자 회원번호 꺼내오고 == > 서브질의로 처리
		// 3. 게시글 데이터베이스 작업
		int cnt = nDao.noticeWrite(nVO);
		String view = "/project/notice/noticeList.proj";
		if(cnt != 1) {
			view = "/project/notice/noticeWrite.proj";
		}
		rv.setUrl(view);
		mv.setView(rv);
		// 반환값 반환하고
		return mv;
	}
	
	// 게시글 상세보기 요청 처리함수
	@RequestMapping("/noticeDetail.proj")
	public ModelAndView noticeDetail(NoticeVO nVO, PageUtil page, ModelAndView mv, HttpSession session, RedirectView rv) {
		// 카운트 업데이트
		int hitCount = nDao.hitCount(nVO.getNotice_no());
		
		if(hitCount != 0) {
			mv.setViewName("notice/noticeDetail");
		} else {
			rv.setUrl("/project/notice/noticeDetail.proj");
			mv.setView(rv);
			return mv;
		}
		
		
		// 게시글정보 
		NoticeVO data = nDao.noticeDetail(nVO.getNotice_no());
		
		// 데이터 전달하고
		mv.addObject("DATA", data);
		mv.addObject("nowPage", page.getNowPage());
		// 뷰 부르고
		mv.setViewName("notice/noticeDetail");
		
		return mv;
	}
	
	// 게시글 수정 폼보기 요청
	@RequestMapping("/noticeEdit.proj")
	public ModelAndView noticeEdit(NoticeVO nVO, ModelAndView mv, HttpSession session, RedirectView rv) {
		// 할일
		// 1. 세션 검사하고
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/project/member/login.proj");
			mv.setView(rv);
			return mv;
		}
		// 2. 데이터 가져오고
		// 게시글 데이터..
		nVO = nDao.noticeDetail(nVO.getNotice_no());
		// 3. 데이터 전달하고
		mv.addObject("DATA", nVO);
		// 4. 뷰 설정하고
		mv.setViewName("notice/noticeEdit");
		// 5. 반환값 반환하고
		return mv;
	}
	
	// 게시글 수정 요청 처리함수
	@RequestMapping("/noticeEditProc.proj")
	public ModelAndView noticeEditProc(NoticeVO nVO, PageUtil page, ModelAndView mv, HttpSession session, RedirectView rv) {
		// 1. 세션 검사하고
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/project/member/login.proj");
			mv.setView(rv);
			return mv;
		}
		mv.addObject("nowPage", page.getNowPage());
		mv.addObject("mno", nVO.getMno());
		mv.addObject("notice_no", nVO.getNotice_no());
		// 2. 게시글 수정 데이터베이스 처리
		if(nVO.getNotice_title() != null || nVO.getContent() != null) {
			int cnt = nDao.noticeEdit(nVO);
			if(cnt != 1) {
				// 수정 작업에 실패한 경우
				mv.addObject("PATH", "/project/notice/noticeEdit.proj");
				return mv;
			}
		}
		
		mv.addObject("PATH", "/project/notice/noticeDetail.proj");
		mv.setViewName("notice/redirectView");
		// 3. 반환값 반환하고
		return mv;
	}
	
	// 게시글 삭제 요청 처리함수
	@RequestMapping("/noticeDel.proj")
	public ModelAndView noticeDel(int nowPage, int notice_no, ModelAndView mv,HttpSession session, RedirectView rv) {
		// 세션검사하고
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/project/member/login.proj");
			mv.setView(rv);
			return mv;
		}
		// 데이터베이스 처리하고
		int cnt = nDao.noticeDel(notice_no);
		// 결과에 따라서 뷰 설정하고
		if(cnt == 1) {
			// 삭제에 성공한 경우
			mv.addObject("PATH", "/project/notice/noticeList.proj");
		} else {
			// 삭제에 실패한 경우
			mv.addObject("PATH", "/project/notice/noticeEdit.proj");
			mv.addObject("NOTICE_NO", notice_no);
		}
		
		mv.addObject("nowPage", nowPage);
		mv.setViewName("notice/redirectView");
		// 반환해주고
		return mv;
	}
	
}