package com.smhrd.model;

public class Notice1VO {
private String nick;
private String email;
private String title;
private String content;
private int number;
private String date;


@Override
public String toString() {
	return "NoticeVO [nick=" + nick + ", email=" + email + ", title=" + title + ", content=" + content + ", number="
			+ number + ", date=" + date + "]";
}



public Notice1VO() {
	super();
	// TODO Auto-generated constructor stub
}



public Notice1VO(String nick, String title, String content) {
	super();
	this.nick = nick;
	this.title = title;
	this.content = content;
}

public Notice1VO(String nick, String email, String title, String content, int number, String date) {
	super();
	this.nick = nick;
	this.email = email;
	this.title = title;
	this.content = content;
	this.number = number;
	this.date = date;
}



public Notice1VO(String nick, String email, String title, String content, String date) {
	super();
	this.nick = nick;
	this.email = email;
	this.title = title;
	this.content = content;
	this.date = date;
}



public Notice1VO(String nick, String title, String content, String date) {
	super();
	this.nick = nick;
	this.title = title;
	this.content = content;
	this.date = date;
}

public String getNick() {
	return nick;
}

public void setNick(String nick) {
	this.nick = nick;
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

public String getDate() {
	return date;
}

public void setDate(String date) {
	this.date = date;
}



}
