package com.koreait.vo;

import java.util.Date;

public class FreeboardVO {
	private int idx, 
	hit;						// 조회수
	private String name,
	pw,
	subject,					// 글 제목
	content,					// 글 내용
	ip;
	private String notice=" ";		// yes=공지글, no=>일반글 
	private Date writeDate;
	private int commentCount;	// 댓글의 개수
	
	
	
	@Override
	public String toString() {
		return "FreeboardVO [idx=" + idx + ", hit=" + hit + ", name=" + name + ", pw=" + pw + ", subject=" + subject
				+ ", content=" + content + ", ip=" + ip + ", notice=" + notice + ", writeDate=" + writeDate
				+ ", commentCount=" + commentCount + "]";
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
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
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	
	
}
