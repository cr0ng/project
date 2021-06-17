package com.increpas.project.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.view.*;

import com.increpas.project.dao.*;
import com.increpas.project.service.*;
import com.increpas.project.vo.*;

/**
 *  설문조사 관련 요청 전담 클래스
 * @author 윤건우
 * @since  2021.06.11
 * @version v.1.0
 * @see	
 * 			작업이력 ]
 * 					2021/06/11	-	담당자		:	윤건우
 * 									작업내용	:	클래스제작
 * 													설문조사 리스트 요청 함수 제작
 *
 */
@Controller
@RequestMapping("/survey")
public class Survey {
	@Autowired
	SurveyDao sDao;
	@Autowired
	SurveyService sSrvc;
	
	/*
	 	진행중인 설문 리스트 요청 함수
	 */
	@RequestMapping("/surveyList.proj")
	public ModelAndView surveyList(ModelAndView mv) {
		// 데이터베이스 조회하고
		List list = sDao.getList();
		// 데이터 전달하고
		mv.addObject("LIST", list);
		// 뷰 설정
		mv.setViewName("survey/surveyList");
		return mv;
	}
	
	/*
	 	설문조사 페이지 요청 처리함수
	 */
	@RequestMapping("/survey.proj")
	public ModelAndView survey(SurveyVO sVO, ModelAndView mv, HttpSession session, RedirectView rv) {
		// 할일
		// 설문에 참여했는지 카운트 가져오고 vo.getTitle();
		int cnt = sDao.answerCnt(sVO);
		if(cnt == 1) {
			// 이미 설문에 참여한경우
			mv.addObject("PATH", "/project/survey/surveyResult.proj");
			mv.addObject("TITLE", sVO.getTitle());
			mv.addObject("SINO", sVO.getSino());
			mv.setViewName("survey/redirectPage");
			
			return mv;
		}
		
		// 문항 리스트 꺼내고
		ArrayList<SurveyVO> list=(ArrayList<SurveyVO>) sDao.questList(sVO.getSino());
		// 문항의 보기리스트 꺼내서 채워주고
		for(SurveyVO s : list) {
			int qno = s.getQno();
			ArrayList<SurveyVO> l = (ArrayList<SurveyVO>) sDao.exList(qno);
			s.setList(l);
		}
		
		// 데이터 전달하고
		mv.addObject("TITLE", sVO.getTitle());
		mv.addObject("LIST", list);
		mv.addObject("LEN", list.size());
		
		// 뷰 부르고
		mv.setViewName("survey/survey");
		return mv;
	}
	
	@RequestMapping("surveyProc.proj")
	public ModelAndView surveyProc(SurveyVO sVO, ModelAndView mv, HttpSession session, RedirectView rv) {
		
		try {
			sSrvc.addSrvyService(sVO, rv, session);
		} catch(Exception e) {
			rv.setUrl("/project/survey/survey.proj");
			e.printStackTrace();
		}
		
		mv.setView(rv);
		return mv;
	}
	@RequestMapping(value = "/surveyResult.proj", params = { "title", "sino" })
	public ModelAndView surveyResult(SurveyVO sVO, ModelAndView mv) {
		// 할일
		// 문항리스트 꺼내고
		ArrayList<SurveyVO> list = (ArrayList<SurveyVO>) sDao.questList(sVO.getSino());
		// 문항 보기 결과 리스트 꺼내서 채워주고
		for(SurveyVO s : list) {
			ArrayList<SurveyVO> l = (ArrayList<SurveyVO>) sDao.getExResult(s);
			s.setList(l);
			System.out.println("$$$$$$" + l);
		}
		// 데이터 전달하고
		mv.addObject("TITLE", sVO.getTitle());
		mv.addObject("LIST", list);
		mv.addObject("LEN", list.size());
		
		mv.setViewName("survey/surveyResult");
		return mv;
	}
}
