package com.smhrd.model;

import java.sql.Date;

public class noticeVO {
	private String email;
	private String title;
	private String content;
	private int number;
	private String c_date;
	private String nick;

	public noticeVO() {
	}

	public noticeVO(String title, String content, int number, String c_date, String nick) {
		super();
		this.title = title;
		this.content = content;
		this.number = number;
		this.c_date = c_date;
		this.nick = nick;
	}

	public noticeVO(String title, int number, String c_date, String nick) {
		super();
		this.title = title;
		this.number = number;
		this.c_date = c_date;
		this.nick = nick;
	}

	public noticeVO(String email, String title, String content, int number, String c_date, String nick) {
		super();
		this.email = email;
		this.title = title;
		this.content = content;
		this.number = number;
		this.c_date = c_date;
		this.nick = nick;
	}

	public noticeVO(String nick, String title, int number, int c_date) {
	}

	public noticeVO(String nick, String title, String content, int number, int date) {
	}

	@Override
	public String toString() {
		return "noticeVO [email=" + email + ", title=" + title + ", content=" + content + ", number=" + number
				+ ", c_date=" + c_date + ", nick=" + nick + "]";
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getC_date() {
		return c_date;
	}

	public void setC_date(String c_date) {
		this.c_date = c_date;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	
}
