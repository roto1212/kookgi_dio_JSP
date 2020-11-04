package com.koreait.myCalendar;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class SolarToLunar {
// 월별 음양력을 크롤링하고 음양력 공휴일을 계산해서 리턴하는 메소드
	public static ArrayList<LunarDate> solarToLunar(int year, int month) {
		
		ArrayList<LunarDate> lunarList = new ArrayList<LunarDate>();	// 1월 ~ 12월의 양력과 대조되는 음력을 기억한다.
		ArrayList<LunarDate> list = new ArrayList<LunarDate>();			// 인수로 넘겨받은 month의 양력에 대응하는 음력을 저장해 리턴할 객체
		String targetSite = "";
		
//		인수로 넘겨받은 year에 해당되는 1월 ~ 12월의 양력과 대조되는 음력을 크롤링해서 얻어온다.
		for (int i = 1; i <= 12; i++) {
			targetSite = String.format("https://astro.kasi.re.kr/life/pageView/5?search_year=%04d&search_month=%02d", year, i);
//			System.out.println(targetSite); //test
//			크롤링한 데이터를 기억할 org.jsoup.nodes패키지의 Document 클래스객체를 선언한다.
			Document document = null; // try구문을 이용할 때는 그 밖에서 선언을 하고 try절안에서 구현한다.
			
			try {
//				Jsoup 패키지의 connect() 메소드로 크롤링 할 타겟사이트에 접속하고 get() 메소드로 타겟사이트의 정보를 얻어온다.
				document = Jsoup.connect(targetSite).get();
//				System.out.println(document);//test
				
//				Document클래스 객체에 저장된 타겟사이트의 정보 중에서  select() 메소드를 사용해서 얻어온다.
				Elements elements = document.select("tbody > tr");
				for (Element element : elements) {
//					System.out.println(element);
					
//					날짜 단위로 얻어온 정보에서 양력, 음력, 간지 단위로 얻어온다.
					Elements ele = element.select("td");
//					System.out.println(ele); // test
//					System.out.println(ele.get(0));		//양력
//					System.out.println(ele.get(1));		//음력
//					text()메소드로 태그을 제외하고 양력, 음력 텍스트만 얻어온다.
					String solar = ele.get(0).text();
					String lunar = ele.get(1).text();
//					System.out.println("양력: "+ solar + " 음력: "+ lunar); //test
//					크롤링한 결과를 LunarDate클래스 객체에 저장해서 배열목록에 넣어준다.
					LunarDate lunarDate = new LunarDate();
//					split() 메소드는 인수로 지정된 구분자를 사용해서 문자열을 나눠 배열로 리턴한다.
//					System.out.println(solar.split("-")[0]);
					lunarDate.setYear(Integer.parseInt(solar.split("-")[0]));
					lunarDate.setMonth(Integer.parseInt(solar.split("-")[1]));
					lunarDate.setDay(Integer.parseInt(solar.split("-")[2].split(" ")[0]));
					lunarDate.setYearLunar(Integer.parseInt(lunar.split("-")[0]));
					lunarDate.setMonthLunar(Integer.parseInt(lunar.split("-")[1]));
					lunarDate.setDayLunar(Integer.parseInt(lunar.split("-")[2].split(" ")[0]));
					lunarDate.setLunarFlag(lunar.length() > 10 ? true : false);
					
					
//					System.out.println(lunarDate);
					
					lunarList.add(lunarDate);					
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
// 		크롤링 끝	
//		공휴일 처리
		for (int i = 0; i < lunarList.size(); i++) {
			int mon = lunarList.get(i).getMonth();
			int d = lunarList.get(i).getDay();
//			양력 공휴일 
			if (mon == 1 && d == 1) {
				lunarList.get(i).setLunar("<br><span>신정</span>");
			}
			if (mon == 3 && d == 1){
				lunarList.get(i).setLunar("<br><span>삼일절</span>");
			}
			if (mon == 5 && d == 1){
				lunarList.get(i).setLunar("<br><span>근로자의 날</span>");
			}
			if (mon == 5 && d == 5){
				lunarList.get(i).setLunar("<br><span>어린이날</span>");
			} 
			if (mon == 6 && d == 6){
				lunarList.get(i).setLunar("<br><span>제헌절</span>");
			} 
			if (mon == 8 && d == 15){
				lunarList.get(i).setLunar("<br><span>광복절</span>");
			} 
			if (mon == 10 && d == 3){
				lunarList.get(i).setLunar("<br><span>개천절</span>");
			}
			if (mon == 10 && d == 9){
				lunarList.get(i).setLunar("<br><span>한글날</span>");
			}
			if (mon == 12 && d == 25){
				lunarList.get(i).setLunar("<br><span>성탄절</span>");
			}
			
//			음력 공휴일
			int lunarMon = lunarList.get(i).getMonthLunar();
			int lunarD = lunarList.get(i).getDayLunar();
//			윤년이 아니고 음력 공휴일이면 공휴일로 표시한다. 
			if (!lunarList.get(i).isLunarFlag() && lunarMon == 1 && lunarD == 1) {
					lunarList.get(i-1).setLunar("<br><span>설날연휴</span>");
					lunarList.get(i).setLunar("<br><span>설날</span>");
					lunarList.get(i+1).setLunar("<br><span>설날연휴</span>");
			}
			if (!lunarList.get(i).isLunarFlag() && lunarMon == 4 && lunarD == 8) {
					lunarList.get(i).setLunar("<br><span>석가탄신일</span>");
			}
			if (!lunarList.get(i).isLunarFlag() && lunarMon == 8 && lunarD == 15) {
					lunarList.get(i-1).setLunar("<br><span>추석연휴</span>");
					lunarList.get(i).setLunar("<br><span>추석</span>");
					lunarList.get(i+1).setLunar("<br><span>추석연휴</span>");
			}
//			대체 공휴일 => 설날, 추석, 어린이날이 주말이나 다른 공휴일과 겹치면 그 다음 비공휴일을 대체 공휴일로 한다.
//			어린이날 대체 공휴일
			if (mon == 5 && d == 6){
				if (MyCalendar.weekDay(year, 5, 5) == 0 ) {
					lunarList.get(i).setLunar("<br><span>어린이날 대체공휴일</span>");
				}
			}
			
			if (mon == 5 && d == 7){
				if (MyCalendar.weekDay(year, 5, 5) == 6) {
					lunarList.get(i).setLunar("<br><span>어린이날 대체공휴일</span>");
				}
			} 
//			어린이날이 석가탄신일인 경우 어린이날의 대체공휴일
			if (mon == 5 && d == 5 && !lunarList.get(i).isLunarFlag() && lunarMon == 4 && lunarD == 8){
				lunarList.get(i).setLunar("<br><span>어린이날</span><br><span>석가탄신일</span>");
				lunarList.get(i+1).setLunar("<br><span>어린이날 대체공휴일</span>");
			}
//			설날 대체 공휴일
			int holiday = MyCalendar.weekDay(year, mon, d);
			if (!lunarList.get(i).isLunarFlag() && lunarMon == 1 && lunarD == 1){
				if (holiday == 0 || holiday == 6 ) {
					lunarList.get(i+2).setLunar("<br><span>설날 대체공휴일</span>");
				}
			}
			
//			추석이 주말과 겹쳤을 때 대체 공휴일
			
			if (!lunarList.get(i).isLunarFlag() && lunarMon == 8 && lunarD == 15){
				if (holiday == 0 || holiday == 6 ) {
					lunarList.get(i+2).setLunar("<br><span>추석 대체공휴일</span>");
				}
			}
//			추석이 개천절과 겹칠 경우 대체공휴일
			if (mon == 10 && d == 3 && !lunarList.get(i).isLunarFlag() && lunarMon == 8 && lunarD == 15){
				lunarList.get(i+2).setLunar("<br><span>추석 대체공휴일</span>");
				lunarList.get(i).setLunar("<br><span>추석</span><br><span>개천절</span>");
			}
			
			
		}
//		1년에 존재하는 모든 공휴일처리를 했으므로 달력출력에 사용할 달의 공휴일정보만 별도로 저장해서 리턴한다.
		for (int i = 0; i < lunarList.size(); i++) {
//			System.out.println(lunarList.get(i));
			if (lunarList.get(i).getMonth() == month) {
				list.add(lunarList.get(i));
//				System.out.println(lunarList.get(i));
			}
			
		}
		
		return list;
	}
	
	
}
