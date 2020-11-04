package com.koreait.onlinePoll;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;


public class PollRead {
	
//	텍스트파일이 저장된 경로를 넘겨받아 텍스트의 파일에 저장된 데이터를 읽어서 배열목록에 저장한후 리턴하는 메서드
	public static ArrayList<String> pollRead(String filepath) {
//		읽어들인 텍스트 파일의 데이터를 저장해 리턴시킬 배열목록를 선언한다.
		ArrayList<String> poll = null;
//		텍스트 파일의 데이터를 읽어들일 스캐너을 선언한다.
		Scanner scanner = null;
		
		try {
//		텍스트 파일에서 데이터를 읽어들일 스캐너 객체를 만든다.
			scanner = new Scanner(new File(filepath));
//			스캐너로 읽어들일 텍스트 파일의 객체가 정상적으로 생성되면 데이터를 저장해 리턴시킬 배열목록의 객체를 생성한다.
			poll = new ArrayList<String>();
			
//			텍스트파일의 끝까지 반복하며 데이터를 읽어 배열목록에 저장한다.
//			hasNextLine(): 스캐너로 다음에 읽어들일 줄이 있으면 true, 아니면 false를 리턴한다.
			while (scanner.hasNextLine()) {
//				빈칸은 출력하지 않는다.
				String str = scanner.nextLine().trim();
				if (str.length() > 0) {
					poll.add(str);
				}
//				if (!str.equals("")) {
//					poll.add(str);
//				} 
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			System.out.println("파일이 디스크에 존재하지 않습니다.");
		}
		
		
//		텍스트 파일에서 읽어들인 데이터가 저장된 배열목록을 리턴시킨다.
		return poll;
	}
}
