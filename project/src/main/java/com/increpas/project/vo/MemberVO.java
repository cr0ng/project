package com.increpas.project.vo;

import java.sql.*;
import java.text.SimpleDateFormat;

public class MemberVO {
   private int user_no, age, cnt;
   private String user_id, user_pw, nickname, gender, email, user_name, sdate;
   private Date jDate;
   private Time jTime;
   
   public int getCnt() {
      return cnt;
   }
   public void setCnt(int cnt) {
      this.cnt = cnt;
   }
   public int getUser_no() {
      return user_no;
   }
   public void setUser_no(int user_no) {
      this.user_no = user_no;
   }
   public int getAge() {
      return age;
   }
   public void setAge(int age) {
      this.age = age;
   }
   public String getUser_id() {
      return user_id;
   }
   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }
   public String getUser_pw() {
      return user_pw;
   }
   public void setUser_pw(String user_pw) {
      this.user_pw = user_pw;
   }
   public String getNickname() {
      return nickname;
   }
   public void setNickname(String nickname) {
      this.nickname = nickname;
   }
   public String getGender() {
      return gender;
   }
   public void setGender(String gender) {
      this.gender = gender;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public String getUser_name() {
      return user_name;
   }
   public void setUser_name(String user_name) {
      this.user_name = user_name;
   }
   public String getSdate() {
      return sdate;
   }
   public void setSdate() {
      SimpleDateFormat form1 = new SimpleDateFormat("yyyy/MM/dd");
      SimpleDateFormat form2 = new SimpleDateFormat(" HH:mm:ss");
      sdate = form1.format(jDate) + form2.format(jTime);
   }
   public void setSdate(String sdate) {
      this.sdate = sdate;
   }
   public Date getjDate() {
      return jDate;
   }
   public void setjDate(Date jDate) {
      this.jDate = jDate;
   }
   public Time getjTime() {
      return jTime;
   }
   public void setjTime(Time jTime) {
      this.jTime = jTime;
   }
   @Override
   public String toString() {
      return "user_no=" + user_no + ", age=" + age + ", cnt=" + cnt + ", user_id=" + user_id + ", user_pw="
            + user_pw + ", nickname=" + nickname + ", gender=" + gender + ", email=" + email + ", user_name="
            + user_name + ", sdate=" + sdate;
   }
   
   
}