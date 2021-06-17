package com.increpas.project.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.*;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.view.RedirectView;

import com.increpas.project.dao.*;
import com.increpas.project.vo.SurveyVO;

public class SurveyService {
	@Autowired
	SurveyDao sDao;
	
	// 설문응답 추가 서비스 함수
	@Transactional
	public void addSrvyService(SurveyVO sVO, RedirectView rv, HttpSession session) {
		// 할일
		// 데이터
		rv.setUrl("/project/survey/survey.proj");
		String sid = (String) session.getAttribute("SID");
		sVO.setId(sid);
		int[] arr = sVO.getQnolist();
		for(int i = 0; i < arr.length; i++) {
			// 문항번호 채우고
			sVO.setQno(arr[i]);
			// 리스트에
			System.out.println("######### " + sVO.getUser_id());
			sDao.insertAnswer(sVO);
		}
		rv.setUrl("/project/survey/surveyList.proj");
	}
}
