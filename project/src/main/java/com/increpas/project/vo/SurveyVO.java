package com.increpas.project.vo;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 *  설문조사 데이터 한개를 기억할 클래스
 * @author 윤건우
 * @since 2021.06.11
 * @version v.1.0
 * @see	
 * 			작업이력 ]
 * 				2021/06/11	-	담당자		:	윤건우
 * 								작업내용	:	클래스 제작
 *
 */
public class SurveyVO {
	private int sino, qno, sno, mno, exno, sqgroup, cnt, totalCnt;
	private double per;
	private String id, user_id, title, body, ex, indate, sdate, edate;
	private Date startdate, enddate, adate;
	private int[] qnolist;
	private ArrayList<SurveyVO> list;
	public int getSino() {
		return sino;
	}
	public void setSino(int sino) {
		this.sino = sino;
	}
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getExno() {
		return exno;
	}
	public void setExno(int exno) {
		this.exno = exno;
	}
	public int getSqgroup() {
		return sqgroup;
	}
	public void setSqgroup(int sqgroup) {
		this.sqgroup = sqgroup;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public double getPer() {
		return per;
	}
	public void setPer(double per) {
		this.per = per;
	}
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getEx() {
		return ex;
	}
	public void setEx(String ex) {
		this.ex = ex;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
		sdate = getStrDate(startdate);
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
		edate = getStrDate(enddate);
	}
	public Date getAdate() {
		return adate;
	}
	public void setAdate(Date adate) {
		this.adate = adate;
		indate = getStrDate(adate);
	}
	public String getStrDate(Date d) {
		SimpleDateFormat form = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		return form.format(d);
	}
	public int[] getQnolist() {
		return qnolist;
	}
	public void setQnolist(int[] qnolist) {
		this.qnolist = qnolist;
	}
	public ArrayList<SurveyVO> getList() {
		return list;
	}
	public void setList(ArrayList<SurveyVO> list) {
		this.list = list;
	}
	@Override
	public String toString() {
		return "SurveyVO : sino=" + sino + ", qno=" + qno + ", sno=" + sno + ", mno=" + mno + ", exno=" + exno
				+ ", sqgroup=" + sqgroup + ", cnt=" + cnt + ", totalCnt=" + totalCnt + ", per=" + per + ", id=" + id
				+ ", user_id=" + user_id + ", title=" + title + ", body=" + body + ", ex=" + ex + ", indate=" + indate
				;
	}
	
	
}
