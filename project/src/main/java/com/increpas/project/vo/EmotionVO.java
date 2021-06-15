package com.increpas.project.vo;

public class EmotionVO {
	private int emno, happy, angry, depressed, excited;
	private int /* mno, posno, */emo;
	private String title, savename, user_id;
	public int getEmno() {
		return emno;
	}
	public void setEmno(int emno) {
		this.emno = emno;
	}
	public int getHappy() {
		return happy;
	}
	public void setHappy(int happy) {
		this.happy = happy;
	}
	public int getAngry() {
		return angry;
	}
	public void setAngry(int angry) {
		this.angry = angry;
	}
	public int getDepressed() {
		return depressed;
	}
	public void setDepressed(int depressed) {
		this.depressed = depressed;
	}
	public int getExcited() {
		return excited;
	}
	public void setExcited(int excited) {
		this.excited = excited;
	}
	/*
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getPosno() {
		return posno;
	}
	public void setPosno(int posno) {
		this.posno = posno;
	}
	*/
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSavename() {
		return savename;
	}
	public void setSavename(String savename) {
		this.savename = savename;
	}
	public int getEmo() {
		return emo;
	}
	public void setEmo(int emo) {
		this.emo = emo;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "emno=" + emno + ", happy=" + happy + ", angry=" + angry + ", depressed=" + depressed
				+ ", excited=" + excited+ ", title=" + title + ", savename="
				+ savename +", user_id=" + user_id + ", emo=" + emo ;
	}
	
	
	
}
