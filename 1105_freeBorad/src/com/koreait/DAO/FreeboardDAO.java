package com.koreait.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.koreait.vo.FreeboardVO;

public class FreeboardDAO {
	private static FreeboardDAO instance = new FreeboardDAO();
	private FreeboardDAO() {}
	public static FreeboardDAO getInstance() {
		return instance;
	}
//	service클래스에서 호출되는 mapper와 테이블에 저장할 메인글이 저장된 객체를 넘겨받고 freeboard.xml파일의 insert.sql명령을 실행하는 메소드
	public void insert(SqlSession mapper, FreeboardVO vo) {
		System.out.println("FreeboardDAO 클래스의 insert() 메소드");
		mapper.insert("insert", vo);
	}
//	service클래스에서 호출되는 mapper를 넘겨받고 테이블에 저장된 메인글 전체 개수를 얻어오는 freeboard.xml의 select sql 명령을 실행하는 메소드
	public int selectCount(SqlSession mapper) {
		System.out.println("FreeboardDAO 클래스의 selectCount() 메소드");
		return (int) mapper.selectOne("selectCount");
	}
//	service클래스에서 호출되는 mapper와 한페이지의 범위가 저장된 startNo, endNo가 저장된 HashMap 객체를 넘겨받고 테이블에 저장된 글 중에서 1페이지 분량의 메인글을 얻어오는 freeboard.xml파일의 select.sql명령을 실행하는 메소드
	public ArrayList<FreeboardVO> selectList(SqlSession mapper, HashMap<String, Integer> hmap) {
		System.out.println("FreeboardDAO 클래스의 selectList() 메소드");
		
		return (ArrayList<FreeboardVO>) mapper.selectList("selectList", hmap);
	}
//	service클래스에서 호출되는 mapper와 조회수를 증가시킬 글번호를 넘겨받고 조회수를 1증가 시키는 freeboard.xml파일의 update sql 명령을 실행하는 메소드
	public void increment(SqlSession mapper, int idx) {
		System.out.println("FreeboardDAO 클래스의 increment() 메소드");
		mapper.update("increment", idx);
	}
//	service클래스에서 호출되는 mapper와 화면에 표시할 글번호를 넘겨받고 메인글 1건을 얻어오는 freeboard.xml 파일의 select sql 명령을 실행하는 메소드
	public FreeboardVO selectByIdx(SqlSession mapper, int idx) {
		System.out.println("FreeboardDAO 클래스의 selectByIdx() 메소드");
		return (FreeboardVO) mapper.selectOne("selectByIdx", idx);
	}
//	service클래스에서 호출되는 mapper와 삭제할 글 번호를 넘겨받고 메인글 1건을 삭제하는 freeboard.xml 파일의 delete sql 명령을 실행하는 메소드
	public void delete(SqlSession mapper, int idx) {
		System.out.println("FreeboardDAO 클래스의 delete() 메소드");
		mapper.delete("delete", idx);
	}
//	service클래스에서 호출되는 mapper와 수정할 글 번호를 넘겨받고 메인글 1건을 수정하는 freeboard.xml 파일의 update sql 명령을 실행하는 메소드
	public void update(SqlSession mapper, FreeboardVO vo) {
		System.out.println("FreeboardDAO 클래스의 update() 메소드");
		mapper.update("update", vo);
	}
//	service클래스에서 호출되는 mapper를 넘겨받고 공지글 전체를 얻어오는 freeboard.xml 파일의 select sql 명령을 실행하는 메소드
	public ArrayList<FreeboardVO> selectNotice(SqlSession mapper) {
		System.out.println("FreeboardDAO 클래스의 selectNotice() 메소드");
		return (ArrayList<FreeboardVO>) mapper.selectList("selectNotice");
	}
	
	
	
}
