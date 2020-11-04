package com.koreait.onlinePoll;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class PollWrite {
//	텍스트파일이 저장할 경로와 텍스트파일에 저장할 투표결과가 저장된 배열목록을 넘겨받아 텍스트의 파일에 저장하는 메서드
	public static void pollWrite(String filepath, ArrayList<String> poll) {
//		배열목록에 저장된 텍스트파일로 저장할 PrintWriter객체를 선언한다.
		PrintWriter printWriter =null;
		try {
//		배열목록에 저장된 텍스트파일로 저장할 PrintWriter객체를 생성한다.
			printWriter = new PrintWriter(filepath);

//		배열목록에 저장된 데이터의 개수만큼 반복하여 배열목록에 저장된 데이터를 텍스트파일에 저장한다.
			for (String str : poll) {
				printWriter.write(str+"\r\n");
			}
		
		
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			System.out.println("디스크에 파일이 존재하지 않습니다.");
		} finally {
//			텍스트파일로 저장에 사용한 객체를 닫는다. 닫지 않으면 파일로 데이터가 저장되지 않는다.
			if (printWriter != null) {
				printWriter.close();
			}
		}
		
	}
}
