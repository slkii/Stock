package com.smhrd.model;

public class MemberVO {


	private String email;
	private String nick;
	private String pw;
	private String tel;
	private String addr;
	
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
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	@Override
	public String toString() {
		return "MemberVO [email=" + email + ", nick=" + nick + ", pw=" + pw + ", tel=" + tel + ", addr=" + addr + "]";
	}
	public MemberVO(String email, String nick, String pw, String tel, String addr) {
		super();
		this.email = email;
		this.nick = nick;
		this.pw = pw;
		this.tel = tel;
		this.addr = addr;
	}
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MemberVO(String email, String pw) {
		super();
		this.email = email;
		this.pw = pw;
	}
	
}