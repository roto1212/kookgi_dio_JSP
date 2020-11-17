package com.koreait.register;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserRegister")
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("UserRegister 서블릿 연결");
		System.out.println("UserRegister 서블릿의 actionDo()");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
//		System.out.println(request.getParameter("userID"));
		String userID = request.getParameter("userID");
		String userPw1 = request.getParameter("userPw1");
		String userPw2 = request.getParameter("userPw2");
		String userName = request.getParameter("userName");
//		int userAge = Integer.parseInt(request.getParameter("userAge"));
		String userAge = request.getParameter("userAge");
		String userGender = request.getParameter("userGender");
		String userEmail = request.getParameter("userEmail");
		
		
//		입력체크
		if (userID == null || userID.trim().equals("") || userPw1 == null || userPw1.trim().equals("") 
				|| userPw2 == null || userPw2.trim().equals("") || userName == null || userName.trim().equals("")
				|| userAge == null || userAge.trim().equals("") || userGender == null || userGender.trim().equals("")
				|| userEmail == null || userEmail.trim().equals("")) {
//			작업의 성공 여부에 따른 메시지를 session에 저장한다.
//			.getSession(): 서블릿에서 세션을 얻어온다.
			request.getSession().setAttribute("msgType", "오류 메시지");
			request.getSession().setAttribute("msgContent", "모든 내용을 입력하세요.");
			response.sendRedirect("index.jsp");
			return;
		}
//		비번 체크
		if (!userPw1.trim().equals(userPw2.trim())) {
			request.getSession().setAttribute("msgType", "오류 메시지");
			request.getSession().setAttribute("msgContent", "비밀번호가 일치하지 않습니다.");
			response.sendRedirect("index.jsp");
			return;
		}
		
		RegisterVO vo = new RegisterVO(userID, userPw1, userName, Integer.parseInt(userAge), userGender, userEmail);
//		System.out.println(vo);
//		System.out.println("pw2: " + userPw2);
		
//		테이블에 회원 정보를 저장하는 메소드를 실행한다.
		int result = new RegisterDAO().register(vo);
//		System.out.println(result);
		if (result == 1) {
			request.getSession().setAttribute("msgType", "성공 메시지");
			request.getSession().setAttribute("msgContent", "회원 가입에 성공했습니다.");
			response.sendRedirect("index.jsp");
			return;
		} else {
			request.getSession().setAttribute("msgType", "오류 메시지");
			request.getSession().setAttribute("msgContent", "이미 존재하는 회원입니다.");
			response.sendRedirect("index.jsp");
			return;
		}
				
	}
}
