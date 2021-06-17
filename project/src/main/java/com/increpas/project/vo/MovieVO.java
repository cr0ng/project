package com.increpas.project.vo;

import java.util.Date;

import com.increpas.project.util.PageUtil;

public class MovieVO {
	
	private int mno, year, hour, platform1, platform2, platform3, rating, posno, gmno, gnum, 
				mnum, gno, startCont, endCont, hno, movie_num, member_num, one_no,
				cnt, user_no, onecnt, pno, platform_num;

	private String title, director, actor1, actor2, actor3, genre, plot, music, url, 
					age_grade, savename, dir, name, user_id, content, singer, osturl, showcode, show, result;

	private Date write_date;

	
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public String getShowcode() {
		return showcode;
	}
	public void setShowcode(String showcode) {
		this.showcode = showcode;
	}
	public int getPlatform_num() {
		return platform_num;
	}
	public void setPlatform_num(int platform_num) {
		this.platform_num = platform_num;
	}
	public String getOsturl() {
		return osturl;
	}
	public void setOsturl(String osturl) {
		this.osturl = osturl;
	}
	public String getSinger() {
		return singer;
	}
	public void setSinger(String singer) {
		this.singer = singer;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getOnecnt() {
		return onecnt;
	}
	public void setOnecnt(int onecnt) {
		this.onecnt = onecnt;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getOne_no() {
		return one_no;
	}
	public void setOne_no(int one_no) {
		this.one_no = one_no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	private PageUtil page;

	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getStartCont() {
		return startCont;
	}
	public void setStartCont(int startCont) {
		this.startCont = startCont;
	}
	public int getEndCont() {
		return endCont;
	}
	public void setEndCont(int endCont) {
		this.endCont = endCont;
	}
	public PageUtil getPage() {
		return page;
	}
	public void setPage(PageUtil page) {
		this.page = page;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getHour() {
		return hour;
	}
	public void setHour(int hour) {
		this.hour = hour;
	}
	public int getPlatform1() {
		return platform1;
	}
	public void setPlatform1(int platform1) {
		this.platform1 = platform1;
	}
	public int getPlatform2() {
		return platform2;
	}
	public void setPlatform2(int platform2) {
		this.platform2 = platform2;
	}
	public int getPlatform3() {
		return platform3;
	}
	public void setPlatform3(int platform3) {
		this.platform3 = platform3;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public int getPosno() {
		return posno;
	}
	public void setPosno(int posno) {
		this.posno = posno;
	}
	public int getGmno() {
		return gmno;
	}
	public void setGmno(int gmno) {
		this.gmno = gmno;
	}
	public int getGnum() {
		return gnum;
	}
	public void setGnum(int gnum) {
		this.gnum = gnum;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor1() {
		return actor1;
	}
	public void setActor1(String actor1) {
		this.actor1 = actor1;
	}
	public String getActor2() {
		return actor2;
	}
	public void setActor2(String actor2) {
		this.actor2 = actor2;
	}
	public String getActor3() {
		return actor3;
	}
	public void setActor3(String actor3) {
		this.actor3 = actor3;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getPlot() {
		return plot;
	}
	public void setPlot(String plot) {
		this.plot = plot;
	}
	public String getMusic() {
		return music;
	}
	public void setMusic(String music) {
		this.music = music;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getAge_grade() {
		return age_grade;
	}
	public void setAge_grade(String age_grade) {
		this.age_grade = age_grade;
	}
	
	public String getSavename() {
		return savename;
	}
	public void setSavename(String savename) {
		this.savename = savename;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	

	@Override
	public String toString() {
		return "MovieVO mno=" + mno + ", year=" + year + ", hour=" + hour + ", platform1=" + platform1 + ", platform2="
				+ platform2 + ", platform3=" + platform3 + ", rating=" + rating + ", posno=" + posno + ", gmno=" + gmno
				+ ", gnum=" + gnum + ", mnum=" + mnum + ", gno=" + gno + ", startCont=" + startCont + ", endCont="
				+ endCont + ", hno=" + hno + ", movie_num=" + movie_num + ", member_num=" + member_num + ", one_no="
				+ one_no + ", cnt=" + cnt + ", user_no=" + user_no + ", onecnt=" + onecnt + ", pno=" + pno
				+ ", platform_num=" + platform_num + ", title=" + title + ", director=" + director + ", actor1="
				+ actor1 + ", actor2=" + actor2 + ", actor3=" + actor3 + ", genre=" + genre + ", plot=" + plot
				+ ", music=" + music + ", url=" + url + ", age_grade=" + age_grade + ", savename=" + savename + ", dir="
				+ dir + ", name=" + name + ", user_id=" + user_id + ", content=" + content + ", singer=" + singer
				+ ", osturl=" + osturl + ", showcode=" + showcode + ", show=" + show + ", write_date=" + write_date
				+ ", page=" + page;
	}
	
}
