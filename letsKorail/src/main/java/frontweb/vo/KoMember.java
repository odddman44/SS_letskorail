package frontweb.vo;

import java.util.Date;

public class KoMember {
	private int member_id;
	private String name;
    private String password;
    private Date birthdate;
    private String gender;
    private String phone;
    private String emailReceiv;
    private String email;
    private String address;
    private long membershipNumber;
    
	public KoMember() {
		// 디폴트 생성자.
	}
	public KoMember(String name, String password, Date birthdate, String gender, String phone, String emailReceiv,
			String email, String address, long membershipNumber) {
		this.name = name;
		this.password = password;
		this.birthdate = birthdate;
		this.gender = gender;
		this.phone = phone;
		this.emailReceiv = emailReceiv;
		this.email = email;
		this.address = address;
		this.membershipNumber = membershipNumber;
	}
	
	// getter and setter
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmailReceiv() {
		return emailReceiv;
	}
	public void setEmailReceiv(String emailReceiv) {
		this.emailReceiv = emailReceiv;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public long getMembershipNumber() {
		return membershipNumber;
	}
	public void setMembershipNumber(long membershipNumber) {
		this.membershipNumber = membershipNumber;
	}
    public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	
}
