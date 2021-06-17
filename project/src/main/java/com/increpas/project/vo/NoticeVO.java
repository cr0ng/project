package com.increpas.project.vo;

import java.text.SimpleDateFormat;
import java.util.*;

public class NoticeVO {
	private int notice_no, mno, hit;
	private String id, user_id, notice_title, content, sdate, nickname;
	private Date reg_date;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
		sdate = form.format(reg_date);
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
		setSdate();
	}
	@Override
	public String toString() {
		return "NoticeVO : notice_no=" + notice_no + ", mno=" + mno + ", hit=" + hit + ", id=" + id + ", user_id="
				+ user_id + ", notice_title=" + notice_title + ", content=" + content + ", sdate=" + sdate
				+ ", nickname=" + nickname + ", reg_date=" + reg_date;
	}
	
}
