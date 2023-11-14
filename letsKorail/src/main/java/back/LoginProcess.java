package back;

import java.util.HashMap;
import java.util.Random;
import java.util.Scanner;

public class LoginProcess {
	private long membershipNum;
	private String phoneNum;
	private String email;
	private String password;
	public static boolean loginFlag = false;
	HashMap<String,String> memberTable = new HashMap<String, String>();
	
	// id,pw getter & setter
	public long getMembershipNum() {
		return membershipNum;
	}
	public void setMembershipNum(long membershipNum) {
		this.membershipNum = membershipNum;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	// 멤버십 로그인 메인메뉴
	public char loginMenu() {
		System.out.println("0. 회원가입 || 1. 멤버십 번호 로그인 || 2. 이메일id 로그인 || 3. 휴대폰 번호 로그인 || 4. 종료");
		System.out.print("메뉴 입력(0~4) : ");
		return insert().charAt(0);
	}
	// 입력 메서드
	public String insert() {
		Scanner sc = new Scanner(System.in);
		return sc.nextLine();
	}
	
	// 회원가입
	public void register() {
		Random random = new Random();
		membershipNum = random.nextLong(1_000_000_000, 10_000_000_000L);
		
		String membershipNumStr = String.format("%010d", membershipNum);
		
		System.out.print("이메일을 입력하세요 : ");
		email = insert();
		do {
	        System.out.print("휴대폰 번호를 입력하세요 (11자리 숫자 형식, 예: 01012345678): ");
	        phoneNum = insert();
	        if(!isValidPhoneNumber(phoneNum)) {
	        	System.out.println("휴대폰번호는 숫자만으로 11자리 입력해주세요.");
	        }
	    } while (!isValidPhoneNumber(phoneNum));
		System.out.print("비밀번호를 입력하세요 : ");
		password = insert();
		
		// 회원정보를 hashmap에 저장
		memberTable.put(membershipNumStr, password);
		memberTable.put(email, password);
		memberTable.put(phoneNum, password);
		
		System.out.println("회원가입이 완료되었습니다. 생성된 멤버십 번호는 "
				+membershipNumStr+" 입니다.");
	}
	
	// 멤버십 번호로 회원을 찾는 메서드
	public boolean findMemberByMSN(long membershipNum) {
		String storedPassword = memberTable.get(String.valueOf(membershipNum));
		return storedPassword != null && storedPassword.equals(password);
	}
	// 이메일로 회원을 찾는 메서드
	public boolean findMemberByEmail(String email) {
		String storedPassword = memberTable.get(email);
		return storedPassword != null && storedPassword.equals(password);
	}
	// 휴대폰 번호로 회원을 찾는 메서드
	public boolean findMemberByPN(String phoneNum) {
		String storedPassword = memberTable.get(phoneNum);
		return storedPassword != null && storedPassword.equals(password);
	}
	// 휴대폰 번호 유효성 검사
	public boolean isValidPhoneNumber(String phoneNum) {
		// 숫자인가? 11자리인가?
		return phoneNum.matches("\\d{11}");
	}
	// 로그인 처리 메서드
	public void login() {
		char choice;
		do {
			choice = loginMenu();
			switch(choice) {
				case '0':
					register();
					break;
				case '1':
					System.out.print("멤버십 번호를 입력하세요 : ");
					membershipNum = Long.parseLong(insert());
					System.out.print("비밀번호를 입력하세요 : ");
					password = insert();
					if(findMemberByMSN(membershipNum)) {
						System.out.println("로그인 성공!");
						loginFlag = true;
					}else {
						System.out.println("로그인 실패!");
					}
					break;
				case'2':
					System.out.print("이메일을 입력하세요 : ");
					email = insert();
					System.out.print("비밀번호를 입력하세요 : ");
					password = insert();
					if(findMemberByEmail(email)) {
						System.out.println("로그인 성공!");
						loginFlag = true;
					}else {
						System.out.println("로그인 실패!");
					}
					break;
				case '3':
					System.out.print("휴대폰 번호를 입력하세요 : ");
					phoneNum = insert();
					System.out.print("비밀번호를 입력하세요 : ");
					password = insert();
					if(findMemberByPN(phoneNum)) {
						System.out.println("로그인 성공!");
						loginFlag = true;
					}else {
						System.out.println("로그인 실패!");
					}
					break;
				case '4':
					System.out.println("프로그램을 종료합니다..");
					System.exit(0);
					break;
				default :
					System.out.println("잘못된 입력입니다. 0~4 입력부탁..");
					break;
			}
		} while (choice != '4');
	}
	
}
