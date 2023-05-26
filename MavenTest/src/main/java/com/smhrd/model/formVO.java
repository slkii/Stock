package com.smhrd.model;

public class formVO {
	private String title;
	private String content;
	private String email;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "formVO [title=" + title + ", content=" + content + ", email=" + email + "]";
	}
	public formVO(String title, String content, String email) {
		super();
		this.title = title;
		this.content = content;
		this.email = email;
	}
	public formVO(String title, String content) {
		super();
		this.title = title;
		this.content = content;
	}
	
	public formVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
}
