package com.koreait.register;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserRegisterCheck")
public class UserRegisterCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("UserRegisterCheck 서블릿 doGet()");
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("UserRegisterCheck 서블릿 doPost()");
		actionDo(request, response);
	}
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("UserRegisterCheck 서블릿 연결");
		System.out.println("UserRegisterCheck 서블릿 actionDo()");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String userID = request.getParameter("userID").trim();
//		System.out.println(userID);
//		가입하려는 아이디가 존재하는가 판단하는 메소드
//		System.out.println(new RegisterDAO().regCheck(userID));
		response.getWriter().write(new RegisterDAO().regCheck(userID) + "");
	}

}
