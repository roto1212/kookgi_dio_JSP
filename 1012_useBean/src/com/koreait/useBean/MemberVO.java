package com.koreait.useBean;

// VO(Value Object) 클래스: 데이터 1건을 기억하는 클래스, DTO(Data Transfer Object), bean
// bean: 자바로 처리하는 최소의 작업단위로 데이터를 저장할 멤버변수와 멤버변수에 데이터를 입출력할 수 있는 getters&setters 메소드로만 구성된 클래스를 의미한다.
public class MemberVO {

//	VO클래스의 멤버변수이름은 VO 클래스에 저장될 데이터가 입력되는 form을 구성하는 요소들의 name속성으로 지정한 이름과 반드시 같은 이름으로 만들어야 한다.
//	데이터베이스 테이블을 사용하는 경우에도 테이블의 필드이름과 VO클래스의 멤버변수이름은 반드시 같은 이름으로 만들어야 한다.
	private String id;
	private String name;	
	private String pw;
	private int age;
	private boolean gender;
	private String ip;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public boolean isGender() {
		return gender;
	}
	public void setGender(boolean gender) {
		this.gender = gender;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", name=" + name + ", pw=" + pw + ", age=" + age + ", gender=" + gender + ", ip="
				+ ip + "]";
	}
	
	
	
}
