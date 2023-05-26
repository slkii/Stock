package com.smhrd.model;

public class formVO {
	private String seq;
	private String title;
	private String content;
	private String email;
	public String getTitle() {
		return title;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
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
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "formVO [seq=" + seq + ", title=" + title + ", content=" + content + ", email=" + email + "]";
	}
	public formVO(String seq, String title, String content, String email) {
		super();
		this.seq = seq;
		this.title = title;
		this.content = content;
		this.email = email;
	}
	public formVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public formVO(String title, String content) {
		super();
		this.title = title;
		this.content = content;
	}
	
	
}
