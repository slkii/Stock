package com.smhrd.model;

public class formVO {
	private String number;
	private String email;
	private String nick;
	private String title;
	private String content;
	private String c_date;
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getC_date() {
		return c_date;
	}
	public void setC_date(String c_date) {
		this.c_date = c_date;
	}
//	@Override
//	public String toString() {
//		return "formVO [number=" + number + ", email=" + email + ", nick=" + nick + ", title=" + title + ", content="
//				+ content + ", c_date=" + c_date + "]";
//	}
	public formVO(String number, String email, String nick, String title, String content, String c_date) {
		super();
		this.number = number;
		this.email = email;
		this.nick = nick;
		this.title = title;
		this.content = content;
		this.c_date = c_date;
	}
	public formVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public formVO(String email, String nick, String title, String content) {
		super();
		this.email = email;
		this.nick = nick;
		this.title = title;
		this.content = content;
	}
	@Override
	public String toString() {
		return "formVO [email=" + email + ", nick=" + nick + ", title=" + title + ", content=" + content + "]";
	}
	

	
}
