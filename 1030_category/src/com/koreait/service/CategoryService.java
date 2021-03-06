package com.koreait.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.koreait.category.CategoryList;
import com.koreait.category.CategoryVO;
import com.koreait.dao.CategoryDAO;
import com.koreait.mybatis.MySession;

public class CategoryService {
	private static CategoryService instance = new CategoryService();
	private CategoryService() {	}
	public static CategoryService getInstance () { return instance;} 
	
//	insert.jsp에서 호출되는 테이블에 저장할 메인 카테고리 정보가 저장된 객체를 넘겨받고 mapper를 얻어온 후 dao클래스의 메인 카테고리를 저장하는 insert sql 명령을 실행하는 메소드를 호출하는 메소드
	
	public void insert(CategoryVO vo) {
		System.out.println("CategoryService 클래스의 insert() 메소드");
//		mybatis mapper를 얻어온다. => mapper가 open 되서 넘어온다.
		SqlSession mapper = MySession.getSession();
		
//		(insert는 전처리가 필요없다.)
		CategoryDAO.getInstance().insert(mapper, vo);
		
//		실행한 sql 명령이 테이블을 변경하는 insert, delete, update는 작업 결과를 테이블에 반영시키기 위해서 반드시 commit() 메소드를 실행해야 한다.
//		테이블을 변경하지 않는 select는 실행하지 않아도 된다.
		mapper.commit();
//		mapper를 사용해서 데이터베이스 작업이 완료되면 반드시 mapper를 닫아야 한다. 
		mapper.close();
	}
	
//	insert.jsp에서 호출되는 mapper를 얻어온 후 DAO 클래스의 테이블에 저장된 전체 카테고리 목록을 얻어오는 select sql 명령을 실행하는 메소드를 호출하는 메소드
	public CategoryList selectList() {
		System.out.println("CategoryService 클래스의 selectList() 메소드");
		SqlSession mapper = MySession.getSession();
		// 전체 카테고리 목록을 저장할 객체를 선언한다.
		CategoryList categoryList = new CategoryList();
		// 테이블에서 얻어온 전체 카테고리 목록을 CategoryList클래스 객체의 배열목록에 저장한다.
		categoryList.setList(CategoryDAO.getInstance().selectList(mapper));
		mapper.close();
		return categoryList;
	}
	
//	reply.jsp에서 호출되는 테이블에 저장할 서브 카테고리 정보가 저장된 객체를 넘겨받고 mapper를 얻어온 후 dao클래스의 서브 카테고리를 저장하는 insert sql 명령을 실행하는 메소드를 호출하는 메소드
	public void reply(CategoryVO vo) {
		System.out.println("CategoryService 클래스의 reply() 메소드");
		SqlSession mapper = MySession.getSession();
		CategoryDAO dao = CategoryDAO.getInstance();
		// 서브 카테고리가 삽입될 위치를 결정하기 위해서 lev와 seq를 1씩 증가시킨다.
		// 서브 카테고리 레벨은 부모 카테고리 레벨보다 1증가시킨다. 
		// 서브 카테고리가 부모 카테고리 바로 아래에 나와야 하므로 출력순서를 1증가 시킨다.
		
		vo.setLev(vo.getLev() + 1);
		vo.setSeq(vo.getSeq() + 1);
		
		// 서브카테고리를 위치에 맞게 삽입하기 위해 같은 카테고리 그룹(ref)의 카테고리 출력순서(seq)를 조정한다.
		
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("ref", vo.getRef()); 
		hmap.put("seq", vo.getSeq());
		
		// 카테고리 출력순서를 조정ㅎ하는 메소드를 실행한다.
		dao.increment(mapper, hmap);
		// 서브 카테고리를 테이블에 삽입하는 메소드를 실행한다.
		dao.reply(mapper, vo);
		
		mapper.commit();
		mapper.close();
		
	}
//	delete.jsp와 update.jsp에서 호출되는 삭제 또는 수정할 카테고리 번호를 넘겨받고 mapper를 얻어온 후 DAO 클래스의 테이블에 저장된 카테고리 한건을 얻어오는 select sql 명령을 실행하는 메소드
	public CategoryVO selectByIdx(int idx) {
		System.out.println("CategoryService 클래스의 selectByIdx() 메소드");
		SqlSession mapper = MySession.getSession();
		
		CategoryVO vo = CategoryDAO.getInstance().selectByIdx(mapper, idx);
		
		
		mapper.close();
		return vo;
		
	}
	
//	delete.jsp에서 호출되는 삭제할 카테고리 번호를 넘겨받고 mapper를 얻어온 후 DAO 클래스의 테이블에 저장된 카테고리 한건을 삭제하는 delete sql명령을 실행하는 메서드
	public void delete(int idx) {
		System.out.println("CategoryService 클래스의 delete() 메소드");
		SqlSession mapper = MySession.getSession();
		CategoryDAO.getInstance().delete(mapper, idx);
		
		mapper.commit();
		mapper.close();
	}
	
//	update.jsp에서 호출되는 수정할 카테고리 번호를 넘겨받고 mapper를 얻어온 후 DAO 클래스의 테이블에 저장된 카테고리 한건을 수정하는 delete sql명령을 실행하는 메서드
	public void update(CategoryVO vo) {
		System.out.println("CategoryService 클래스의 update() 메소드");
		SqlSession mapper = MySession.getSession();
		CategoryDAO.getInstance().update(mapper, vo);
		
		mapper.commit();
		mapper.close();
	}

//	delete.jsp에서 호출되는 삭제할 카테고리 번호를 넘겨받고 mapper를 얻어온 후 DAO 클래스의 테이블에 저장된 카테고리 한건을 "삭제된 카테고리 입니다." 로 수정하는 update sql명령을 실행하는 메서드
	
	public void deleteCategory(int idx) {
		System.out.println("CategoryService 클래스의 deleteCategory() 메소드");
		SqlSession mapper = MySession.getSession();
		CategoryDAO.getInstance().deleteCategory(mapper, idx);
		
		mapper.commit();
		mapper.close();
	}
//	delete.jsp에서 호출되는 삭제할 카테고리 번호를 넘겨받고 mapper를 얻어온 후 DAO 클래스의 테이블에 저장된 카테고리 한건의 deleteCheck필드를 "yes"로 수정하는 update sql명령을 실행하는 메서드를 호출하는 메서드
	public void deleteCheck(int idx) {
		System.out.println("CategoryService 클래스의 deleteCheck() 메소드");
		SqlSession mapper = MySession.getSession();
		CategoryDAO.getInstance().deleteCheck(mapper, idx);
		
		mapper.commit();
		mapper.close();
	}
//	deleteRestore.jsp에서 호출되는 복구할 카테고리 번호를 넘겨받고 mapper를 얻어온 후 DAO 클래스의 테이블에 저장된 카테고리 한건의 deleteCheck필드를 "no"로 수정하는 update sql명령을 실행하는 메서드를 호출하는 메서드
	public void deleteRestore(int idx) {
		System.out.println("CategoryService 클래스의 deleteRestore() 메소드");
		SqlSession mapper = MySession.getSession();
		CategoryDAO.getInstance().deleteRestore(mapper, idx);
		
		mapper.commit();
		mapper.close();
	}
	
//	deleteReport.jsp에서 호출되는 신고할 카테고리 번호를 넘겨받고 mapper를 얻어온 후 DAO 클래스의 테이블에 저장된 카테고리 한건의 deleteReport 필드를 1 증가시키는 update sql명령을 실행하는 메서드를 호출하는 메서드
	public void deleteReport(int idx) {
		System.out.println("CategoryService 클래스의 deleteReport() 메소드");
		SqlSession mapper = MySession.getSession();
		CategoryDAO.getInstance().deleteReport(mapper, idx);
		
		mapper.commit();
		mapper.close();
	}
	
//	delete.jsp에서 호출되는 삭제할 카테고리 정보가 저장된 객체를 넘겨받고 mapper를 얻어온 후 DAO 클래스의 테이블에 저장된 삭제할 카테고리 목록을 얻어오는 select sql 명령을 실행하는 메서드
	public ArrayList<CategoryVO> deleteList(CategoryVO vo) {
		System.out.println("CategoryService 클래스의 deleteList() 메소드");
		SqlSession mapper = MySession.getSession();
		ArrayList<CategoryVO> deleteList = CategoryDAO.getInstance().deleteList(mapper, vo);
		mapper.close();
		return deleteList;
	}
//	delete.jsp에서 호출되는 seq를 다시 부여할 카테고리 그룹(ref)를 넘겨받고 mapper를 얻어온 후 DAO 클래스의 테이블에 저장된 삭제한 카테고리 그룹의 seq를 0부터 다시 부여하는 update sql 명령을 실행하는 DAO클래스의 메소드를 호출하는 Service클래스의 메소드
	public void reSeq(int ref) {
		System.out.println("CategoryService 클래스의 reSeq() 메소드");
		SqlSession mapper = MySession.getSession();
		CategoryDAO dao = CategoryDAO.getInstance();
//		seq를 다시부여할 카테고리 그룹만 얻어와서 배열목록에 저장한다.
		ArrayList<CategoryVO> refList = dao.selectRef(mapper, ref);
//		for (CategoryVO vo : refList) {
//			System.out.println(vo);
//		}
//		배열목록으로 얻어온 카테고리 그룹에 카테고리 개수만큼 반복하여 seq를 0부터 다시 부여한다.
		for (int i = 0; i < refList.size(); i++) {
//			seq를 수정할 카테고리 번호(idx)와 seq를 수정할 데이터(i)를 HashMap 객체에 저장한다.
			HashMap<String, Integer> hmap = new HashMap<String, Integer>();
			hmap.put("idx", refList.get(i).getIdx());
			hmap.put("seq", i);
			dao.updateSeq(mapper, hmap);
		}
		mapper.commit();
		mapper.close();

	}
	
}
