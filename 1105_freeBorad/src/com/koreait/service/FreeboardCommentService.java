package com.koreait.service;

import org.apache.ibatis.session.SqlSession;

import com.koreait.DAO.FreeboardCommentDAO;
import com.koreait.mybatis.MySession;
import com.koreait.vo.FreeboardCommentList;
import com.koreait.vo.FreeboardCommentVO;
import com.koreait.vo.FreeboardVO;


public class FreeboardCommentService {
	private static FreeboardCommentService instance = new FreeboardCommentService();
	private FreeboardCommentService() {	}
	public static FreeboardCommentService getInstance() {return instance;}
//	commentOK.jsp에서 호출되는 댓글로 저장할 데이터가 담긴 객체를 넘겨받고 mapper를 얻어온 후 DAO클래스의 댓글을 저장하는 insert sql 명령을 실행하는 메소드를 호출하는 메소드	
	public boolean insertComment(FreeboardCommentVO vo) {
		System.out.println("FreeboardCommentService 클래스의 insertComment() 메소드");
		SqlSession mapper = MySession.getSession();
		
		try {
			FreeboardCommentDAO.getInstance().insertComment(mapper, vo);
			mapper.commit();
			mapper.close();
			return true;
			
		} catch (Exception e) {
			mapper.close();
			e.printStackTrace();
			return false;
		}
	}
//	list.jsp가 호출하는 메인글의 글번호를 넘겨받고 mapper를 얻어온 후 DAO 클래스의 댓글의 개수를 얻어오는 select sql 명령을 실행하는 메소드를 호출하는 메소드
	public int commentCount(int idx) {
		System.out.println("FreeboardCommentService 클래스의 insertComment() 메소드");
		SqlSession mapper = MySession.getSession();
		int commentCount = FreeboardCommentDAO.getInstance().commentCount(mapper, idx);
		
		mapper.close();
		return commentCount;
	}
	
//	selectByIdx.jsp가 호출하는 메인글의 글번호를 넘겨받고 mapper를 얻어온 후 DAO 클래스의 댓글 목록을 얻어오는 select sql 명령을 실행하는 메소드를 호출하는 메소드
	public FreeboardCommentList selectCommentList(int idx) {
		System.out.println("FreeboardCommentService 클래스의 insertComment() 메소드");
		SqlSession mapper = MySession.getSession();
		FreeboardCommentList freeboardCommentList = new FreeboardCommentList();
				
		freeboardCommentList.setList(FreeboardCommentDAO.getInstance().selectCommentList(mapper, idx));		
		mapper.close();
//		System.out.println(freeboardCommentList);
		
		return freeboardCommentList;
	}
//	commentOK.jsp가 호출하는 삭제할 정보가 들어있는 객체를 넘겨받고  mapper를 얻어온 후 DAO 클래스에서 댓글을 삭제하는 delete sql 명령을 실행하는 메소드를 호출하는 메소드
	public boolean deleteComment(FreeboardCommentVO vo) {
		System.out.println("FreeboardCommentService 클래스의 deleteComment() 메소드");
		SqlSession mapper = MySession.getSession();
		
		FreeboardCommentDAO dao = FreeboardCommentDAO.getInstance();
//		삭제하기 위해 입력한 비밀번호와 삭제할 댓글의 비밀번호를 비교하기 위해 삭제할 댓글 1건을 얻어온다.
		FreeboardCommentVO original = dao.selectCommentByIdx(mapper, vo.getIdx());
		if (original.getPw().trim().equals(vo.getPw())){
			dao.deleteComment(mapper, vo.getIdx());
			mapper.commit();
			mapper.close();
			return true;
			
 		} else {
 			mapper.close();
 			return false;
 		}
		
	}
//	commentOK.jsp가 호출하는 수정할 정보가 들어있는 객체를 넘겨받고  mapper를 얻어온 후 DAO 클래스에서 댓글을 수정하는 update sql 명령을 실행하는 메소드를 호출하는 메소드
	public boolean updateComment(FreeboardCommentVO vo) {
		System.out.println("FreeboardCommentService 클래스의 updateComment() 메소드");
		SqlSession mapper = MySession.getSession();
		
		FreeboardCommentDAO dao = FreeboardCommentDAO.getInstance();
//		삭제하기 위해 입력한 비밀번호와 수정할 댓글의 비밀번호를 비교하기 위해 수정할 댓글 1건을 얻어온다.
		FreeboardCommentVO original = dao.selectCommentByIdx(mapper, vo.getIdx());
		if (original.getPw().trim().equals(vo.getPw())){
			dao.updateComment(mapper, vo);
			mapper.commit();
			mapper.close();
			return true;
			
 		} else {
 			mapper.close();
 			return false;
 		}
		
	}
}
