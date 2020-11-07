package com.koreait.category;

public class CategoryVO {
	private int idx, 				//카테고리 일련번호
	ref,							//카테고리 그룹 
	lev, 							//카테고리 레벨
	seq,							//같은 카테고리 내부에서 카테고리 출력순서
	deleteReport;					//신고 누적횟수
	private String category,		//category 이름
	deleteCheck;					//카테고리 삭제여부(no => 일반 카테고리, yes => 삭제한 카테고리
						
	
	
	
	@Override
	public String toString() {
		return "CategoryVO [idx=" + idx + ", ref=" + ref + ", lev=" + lev + ", seq=" + seq + ", deleteReport="
				+ deleteReport + ", category=" + category + ", deleteCheck=" + deleteCheck + "]";
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
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDeleteCheck() {
		return deleteCheck;
	}
	public void setDeleteCheck(String deleteCheck) {
		this.deleteCheck = deleteCheck;
	}
	public int getDeleteReport() {
		return deleteReport;
	}
	public void setDeleteReport(int deleteReport) {
		this.deleteReport = deleteReport;
	}
	
	
}
