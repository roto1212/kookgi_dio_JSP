package com.koreait.vo;

import java.util.Date;

public class FreeboardCommentVO {
	private int idx, 
	ref;									// 메인글의 글번호, 어떤 메인글의 댓글인가를 의미한다.
	private String name, pw, content, ip;
	private Date writeDate;
	
	@Override
	public String toString() {
		return "freeboardComment [idx=" + idx + ", ref=" + ref + ", name=" + name + ", pw=" + pw + ", content="
				+ content + ", ip=" + ip + ", writeDate=" + writeDate + "]";
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	
	
}
