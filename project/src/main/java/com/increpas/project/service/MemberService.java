package com.increpas.project.service;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;

import com.increpas.project.vo.MemberVO;

@Service
public class MemberService {
	// 비밀번호 찾기 이메일 전송
		public static String sendMail(MemberVO mVO) {
			
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 8; i++) {
				pw += (char) ((Math.random() * 26) + 97);	// 영어 소문자 8자
			}
						
			// Mail Server 설정
			String charSet = "UTF-8";
			String hostSMTP = "smtp.naver.com";
			String hostSMTPid = "heart_yujin@naver.com";	// 보내는 사람 이메일
			String hostSMTPpw = "movie_project";	// 보내는 사람 이메일 비밀번호
			
			String fromEmail = "heart_yujin@naver.com";	// 보내는 사람 이메일 주소
			String fromName = "ITCHA";	// 보내는 사람 이름
			String subject = "";	// 제목
			String msg = "";	// 내용
		
			subject = "itcha 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>ITCHA 임시 비밀번호 입니다. 로그인 후 비밀번호를 변경하세요</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += pw + "</p></div>";
			
			
			// 받는 사람 
			String mail = mVO.getEmail();
			System.out.println(mail);
			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				email.setSSL(true);
				email.setHostName(hostSMTP);
				email.setSmtpPort(587); // 네이버 

				email.setAuthentication(hostSMTPid, hostSMTPpw);
				email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg(msg);
				email.send();
			} catch (EmailException e) {
				System.out.println("메일발송 실패 : " + e);
			}
			
			return pw;
		
		}
}
