package com.obbang.model.member;

public class MemberVO {
	
	private int user_bno;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_year;
	private String user_email;
	private String user_phone;
	private String user_address1;
	private String user_address2;
	private String user_address3;
	private String user_month;
	private String user_day;
	private String user_sex;
	private int user_admin;
	public int getUser_bno() {
		return user_bno;
	}
	public void setUser_bno(int user_bno) {
		this.user_bno = user_bno;
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
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_year() {
		return user_year;
	}
	public void setUser_year(String user_year) {
		this.user_year = user_year;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_address1() {
		return user_address1;
	}
	public void setUser_address1(String user_address1) {
		this.user_address1 = user_address1;
	}
	public String getUser_address2() {
		return user_address2;
	}
	public void setUser_address2(String user_address2) {
		this.user_address2 = user_address2;
	}
	public String getUser_address3() {
		return user_address3;
	}
	public void setUser_address3(String user_address3) {
		this.user_address3 = user_address3;
	}
	public String getUser_month() {
		return user_month;
	}
	public void setUser_month(String user_month) {
		this.user_month = user_month;
	}
	public String getUser_day() {
		return user_day;
	}
	public void setUser_day(String user_day) {
		this.user_day = user_day;
	}
	public String getUser_sex() {
		return user_sex;
	}
	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}
	public int getUser_admin() {
		return user_admin;
	}
	public void setUser_admin(int user_admin) {
		this.user_admin = user_admin;
	}
	@Override
	public String toString() {
		return "MemberVO [user_bno=" + user_bno + ", user_id=" + user_id + ", user_pw=" + user_pw + ", user_name="
				+ user_name + ", user_year=" + user_year + ", user_email=" + user_email + ", user_phone=" + user_phone
				+ ", user_address1=" + user_address1 + ", user_address2=" + user_address2 + ", user_address3="
				+ user_address3 + ", user_month=" + user_month + ", user_day=" + user_day + ", user_sex=" + user_sex
				+ ", user_admin=" + user_admin + "]";
	}
	
}
