package com.increpas.project.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.*;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.view.RedirectView;

import com.increpas.project.dao.*;
import com.increpas.project.vo.SurveyVO;

public class SurveyService {
	@Autowired
	SurveyDao suDao;
	
	// 설문응답 추가 서비스 함수
	@Transactional
	public void addSrvyService(SurveyVO suVO, RedirectView rv, HttpSession session) {
		// 할일
		// 데이터
		rv.setUrl("/project/survey/survey.proj");
		String sid = (String) session.getAttribute("SID");
		suVO.setId(sid);
		int[] arr = suVO.getQnolist();
		for(int i = 0; i < arr.length; i++) {
			// 문항번호 채우고
			suVO.setQno(arr[i]);
			// 리스트에
			suDao.insertAnswer(suVO);
		}
		rv.setUrl("/project/survey/surveyList.proj");
	}
}
