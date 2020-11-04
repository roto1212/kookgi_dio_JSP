<%@page import="com.koreait.myCalendar.SolarToLunar"%>
<%@page import="com.koreait.myCalendar.LunarDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="com.koreait.myCalendar.MyCalendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만년달력</title>

<!--  인터널 방식의 스타일: 태그마다 스타일을 따로 주는게 아니라 사용하는 태그와 거기에 걸려잇는 클래스와 아이디마다 스타일을 적용한다.-->
<style type="text/css">
	
	tr {
		height: 80px; 
	}
	th#title {
		font-size: 30pt; font-weight: bold;
		color: tomato; font-family: D2Coding;
	}
	td.sunday{
	
		font-size: 20pt;font-weight: bold;font-family: D2Coding;
		text-align: center;width: 100px;
		color: red;
	}
	td.saturday{
	
		font-size: 20pt;font-weight: bold;font-family: D2Coding;
		text-align: center;width: 100px;
		color: blue;
	}
	td.etcday{
		font-size: 20pt;font-weight: bold;font-family: D2Coding;
		text-align: center;width: 100px;
	}
	td.sun{
	
		font-size: 15pt;font-weight: bold;font-family: D2Coding;
		text-align: right; vertical-align: top;  width: 100px;
		color: red;
	}
	td.sat{
	
		font-size: 15pt;font-weight: bold;font-family: D2Coding;
		text-align: right; vertical-align: top; width: 100px;
		color: blue;
	}
	td.etc{
		font-size: 15pt;font-weight: bold;font-family: D2Coding;
		text-align: right; vertical-align: top; width: 100px;
	}
	
	td.preSun{
	
		font-size: 12pt;font-weight: bold;font-family: D2Coding;
		text-align: right; vertical-align: top;  width: 100px;
		color: red;
	}
	td.preEtc{
		font-size: 12pt;font-weight: bold;font-family: D2Coding;
		text-align: right; vertical-align: top; width: 100px;
	}
	td.nextSat{
		font-size: 12pt;font-weight: bold;font-family: D2Coding;
		text-align: right; vertical-align: top;  width: 100px;
		color: blue;
	}
	td.nextEtc{
		font-size: 12pt;font-weight: bold;font-family: D2Coding;
		text-align: right; vertical-align: top; width: 100px;
	}
	.select {	
		width: 100px; height: 30px;
	}
	.holiday{
		font-size: 15pt;font-weight: bold;font-family: D2Coding;
		text-align: right; vertical-align: top;  width: 100px;
		color: red; background: yellow;
	}
	span{
		font-size: 9pt;
	}
	a:link { /*한번도 클릭하지 않은 경우 */
		color: black;
		text-decoration: none;
	}
	a:visited { /*한번 이상 클릭한 경우*/
		color: black;
		text-decoration: none;
	}
	a:hover { /* 마우스를 올리고 있을 때*/
		text-decoration: underline;
	} 
	a:active { /* 마우스로 누르고 있을 때*/	
		color: skyblue;
		text-decoration: none;
	}
</style>
</head>
<body>
<%
/* 	out.println(MyCalendar.isLeapYear(2020)+"<br>");
	out.println(MyCalendar.lastDay(2020, 9)+"<br>");
	out.println(MyCalendar.totalDay(2020, 9, 23)+"<br>");
	out.println(MyCalendar.weekDay(2020, 9, 23)+"<br>");
 */	
 
 //	컴퓨터시스템의 년월을 적절한 변수에 저장한다.
/*  	Date date = new Date();
 	int year = date.getYear()+1900;
 	int month = date.getMonth()+1;
 */
 	Calendar calendar = Calendar.getInstance();
 	int year = calendar.get(Calendar.YEAR);
 	int month = calendar.get(Calendar.MONTH) +1;
// 	out.println(year + "년" + month + "월");
	
//	이전다음달 하이퍼링크 또는 버튼을 클릭햇을 때 넘어오는 달력을 출력할 년월을 받는다. 
	try {
		year = Integer.parseInt(request.getParameter("year"));
		month = Integer.parseInt(request.getParameter("month"));
//		month에 13이 넘어왓으면 달력에는 다음해 1월을 표시해야 하고 month에 0이 넘어왓으면 저년도 12월을 표시해야 한다.
		if (month <= 0 ){
			year--;
			month = 12;
		} else if (month >=13){
			year++;
			month = 1;
		}
	} catch (NumberFormatException e) {
	}
	
// 달력을 출력할 달의 음양력 대조결과를 얻어온다.
	ArrayList<LunarDate> lunarDates = SolarToLunar.solarToLunar(year, month);
	
%>

<!-- 달력을 만든다. -->

<table width="700" align="center" border="1" cellpadding="5" cellspacing="0">
	
	<tr>
		<th>
			<%-- <a href="?year=<%=year%>&month=<%=month - 1 %>">이전달</a> --%>
			<input type="button" value="← 이전달" onclick="location.href='?year=<%=year%>&month=<%=month - 1 %>'">
		</th>
		<!-- colspan="":열병합 -->
		<th id="title" colspan="5"><%=year%>년 <%=month %>월 </th>
		<th>
			<%-- <a href="?year=<%=year%>&month=<%=month + 1 %>">다음달</a> --%>
			<button type="button" onclick="location.href='?year=<%=year%>&month=<%=month + 1 %>'">다음달&nbsp;→</button>
		</th>
	</tr>
	<tr>
		<td class="sunday">일</td>
		<td class="etcday">월</td>
		<td class="etcday">화</td>
		<td class="etcday">수</td>
		<td class="etcday">목</td>
		<td class="etcday">금</td>
		<td class="saturday">토</td>
	</tr>
	<!-- 달력에 날짜를 출력한다. -->
	<tr>
	<%
//	달력을 출력할 달 1일의 요일을 저장한다.
	int month1stDay = MyCalendar.weekDay(year, month, 1);
	
//	달력의 첫날의 요일 인덱스만큼 빈칸을 넣는다.
	/* for (int i = 0; i < month1stDay; i++){
		out.println("<td>&nbsp;</td>");
	} */
//	빈 칸에 출력할 전 달 날짜의 시작일을 계산한다.
	int preRestStart = 0;
	if (month == 1) { //1월인 경우
		preRestStart	= 31 - month1stDay ; //12월의 마지막 일은 31일 고정이므로 
	} else { //1월이 아닌경우
		// 전달의 마지막일에서 당월 시작일의 요일인덱스를 뺀다.
		preRestStart = MyCalendar.lastDay(year, month-1) - month1stDay ;
	}
//	달력의 첫날의 요일 인덱스만큼 빈칸을 넣는다.
	 for (int i = 0; i < month1stDay; i++){
		 // preRestStart에서 1을 더하고 반복한다.
		if (i == 0 ){
			out.println("<td class='preSun'>"+ (month == 1 ? 12 : month - 1) +"/"+ ++preRestStart + "</td>");
			
		} else {
		 	out.println("<td class='preEtc'>"+ (month == 1 ? 12 : month - 1) +"/"+ ++preRestStart + "</td>");
			
		}
	}
	
//	1일부터 달력을 출력할 달의 마지막 날짜까지 반복하며 날짜를 출력한다.
	for (int i = 1; i <= MyCalendar.lastDay(year, month);i++){
		
//	공휴일인가 평일인가 판단해서 class 속성을 다르게 지정해서 날짜를 출력한다.
		
		// lunar에 공휴일 데이터를 넣어놧으므로 null이면 평일이다.
		if (lunarDates.get(i - 1).getLunar() == null ){
//		날짜의 색깔을 일요일이면 빨간색, 토요일이면 파란색, 그 외의 날짜는 검은색으로 한다. td태그에 요일에 따른 class 속성을 지정한다.
			switch (MyCalendar.weekDay(year, month, i)){
			case 0:	//일요일
				out.println("<td class='sun'>"+ i + "</td>");
				break;
			case 6:	//토요일
				out.println("<td class='sat'>"+ i + "</td>");
				break;
			default: //평일
				out.println("<td class='etc'>"+ i + "</td>");
				break;
			}
		} else {
			out.println("<td class='holiday'>"+ i + lunarDates.get(i - 1).getLunar() + "</td>");
		}
		
		
		/*
		if (MyCalendar.weekDay(year, month, i)==0){
			out.println("<td class=sunday>"+ i + "</td>");
		} else if (MyCalendar.weekDay(year, month, i)==6) {
			out.println("<td class=saturday>"+ i + "</td>");
		} else {
			out.println("<td class=etcday>"+ i + "</td>");
		}*/

		
//		출력할 날짜가 토요일이면 줄을 바꾸고 그 달의 마지막 날짜가 아니면 줄을 바꾼다.
		if (MyCalendar.weekDay(year, month, i)==6 && i != MyCalendar.lastDay(year, month)){
			out.println("</tr><tr>");
		}
	}

//	다음달 1일의 요일을 계산한다.	
	
	if (month == 12){
		month1stDay = MyCalendar.weekDay(year+1, 1, 1);		//12월
	} else {
		month1stDay = MyCalendar.weekDay(year, month+1, 1); //1월~11월
	}
//	날짜를 다 출력하고 남은 빈칸에 다음달의 날짜를 다음달의 토요일까지 반복한다.
	int Start = 0;
	for (int i = month1stDay; i <= 6;i++){
		if (month1stDay == 0){
			break;
		}
		if (i == 6 ){
			out.println("<td class='nextSat'>"+ (month == 12 ? 1 : month + 1) +"/"+ ++Start + "</td>");
			
		} else {
		 	out.println("<td class='nextEtc'>"+ (month == 12 ? 1 : month + 1) +"/"+ ++Start + "</td>");
		}
	}
	%>
	
	</tr>
	<!-- 연월을 선택하고 보기버튼을 클릭하면 특정달의 달력으로 한번에 넘어가게 한다.  -->
	<tr>
		<td colspan="7" align="center">
			<form action="?" method="post">
				<select class="select" name="year" >
				<%
				for (int i = 1950; i < 2051; i++){
					if (i == calendar.get(Calendar.YEAR)){
						out.println("<option selected='selected'>"+i+"</option>");
					} else {
						out.println("<option>"+i+"</option>");
					}
				}
				%>
				</select>년
				<select class="select" name="month" >
				<%
				for (int i = 1; i <= 12; i++){
					out.println("<option>"+i+"</option>");
				}
				%>
				</select>월
				<input class="select" type="submit" value="보기">			
				</form>
			
			
		</td>
	</tr>
	
</table>
</body>
</html>