package back;

import java.util.HashMap;
import java.util.Scanner;

public class LoginProcess {
	private long membershipNum;
	private String phoneNum;
	private String email;
	private String password;
	public static boolean loginFlag = false;
	HashMap<String,String> memberTable = new HashMap<String, String>();
	
	// id,pw getter & setter

	// 멤버십 로그인 메인메뉴
	public char loginMenu() {
		System.out.println("1. 멤버십 번호 로그인 || 2. 이메일id 로그인 || 3. 휴대폰 번호 로그인 || 4. 종료");
		System.out.println("메뉴 입력(1~4) : ");
		return insert().charAt(0);
	}
	// 입력 메서드
	public String insert() {
		Scanner sc = new Scanner(System.in);
		return sc.nextLine();
	}
}
