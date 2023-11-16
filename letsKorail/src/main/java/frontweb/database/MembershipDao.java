package frontweb.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import frontweb.vo.KoMember;

public class MembershipDao {
	
	public void addMember(KoMember member) {
		int insCnt = 0;
		String sql = "INSERT INTO koMember \r\n"
				+ "(member_id, name, password, birthdate, gender, phone, emailReceiv, email, address, membershipNumber)\r\n"
				+ "VALUES (member_id_sequence.NEXTVAL, ?, ?, TO_DATE(?, 'YYYY-MM-DD'),\r\n"
				+ "?, ?, ?, ?,\r\n"
				+ "?, ?)";
	    try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
	        con.setAutoCommit(false);
	        // 처리코드1
	        pstmt.setString(1, member.getName());
	        pstmt.setString(2, member.getPassword());
	        pstmt.setString(3, new SimpleDateFormat("yyyy-MM-dd").format(member.getBirthdate())); // 날짜 형식 변환
	        pstmt.setString(4, member.getGender());
	        pstmt.setString(5, member.getPhone());
	        pstmt.setString(6, member.getEmailReceiv());
	        pstmt.setString(7, member.getEmail());
	        pstmt.setString(8, member.getAddress());
	        pstmt.setLong(9, member.getMembershipNumber());

	        insCnt = pstmt.executeUpdate();
	        if(insCnt == 0) {
	        	System.out.println("CUD 실패");
	        	con.rollback();
	        }else {
	        	con.commit(); // Commit the transaction
	        	System.out.println("CUD 성공");
	        }
	    } catch (SQLException e) {
	        System.out.println("DB 에러:" + e.getMessage());
	    } catch (Exception e) {
	        System.out.println("일반 에러:" + e.getMessage());
	    }

	}
	
	public List<KoMember> getMemberSch(KoMember sch){
		List<KoMember> memList = new ArrayList<KoMember>();
		String sql="SELECT *\r\n"
				+ "FROM KOMEMBER\r\n"
				+ "WHERE name LIKE ?'";
		try( Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);){
			// 처리코드1
			pstmt.setString(1,"%"+sch+"%");
			try( ResultSet rs = pstmt.executeQuery();){
				//처리코드2
				rs.next();
			}
		}catch(SQLException e) {
			System.out.println("DB 에러:"+e.getMessage());
		}catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}
		return memList;
	}
	
	// membershipNumber 중복 파악 메서드
	public boolean isMembershipNumberUnique(long membershipNumber) {
		String sql = "SELECT count(*)\r\n"
				+ "FROM KOMEMBER \r\n"
				+ "WHERE MEMBERSHIPNUMBER = ?";
		 try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			 	// 처리코드 1
		        pstmt.setLong(1, membershipNumber);
		        try (ResultSet rs = pstmt.executeQuery()) {
		        	//처리코드 2
		            if (rs.next()) {
		                return rs.getInt(1) == 0; // 멤버십 번호가 중복되지 않았을 때 true 반환
		            }
		        }
		    } catch (SQLException e) {
		        System.out.println("DB 에러: " + e.getMessage());
		    } catch (Exception e) {
		        System.out.println("일반 에러: " + e.getMessage());
		    }
		 return false;
	}
	
	// 로그인 메서드
	/*
	 * String name, String password, Date birthdate, String gender, String phone, String emailReceiv,
			String email, String address, long membershipNumber
	 */
	public KoMember login(long membershipNumber, String password) {
		KoMember komem = null;
		String sql ="SELECT *\r\n"
				+ "FROM KoMember\r\n"
				+ "WHERE MEMBERSHIPNUMBER = ? AND PASSWORD = ?";
		try( Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);){
			// 처리코드1
			pstmt.setLong(1, membershipNumber);
			pstmt.setString(2, password);
			try( ResultSet rs = pstmt.executeQuery();){
				//처리코드2
				if(rs.next()) {
					komem = new KoMember(
		                    rs.getString("name"),
		                    rs.getString("password"),
		                    rs.getDate("birthdate"),
		                    rs.getString("gender"),
		                    rs.getString("phone"),
		                    rs.getString("emailReceiv"),
		                    rs.getString("email"),
		                    rs.getString("address"),
		                    rs.getLong("membershipNumber")
							); 			// ResultSet에서 데이터를 추출하여 komem 객체에 설정 
				}
			}
		}catch(SQLException e) {
			System.out.println("DB 에러:"+e.getMessage());
		}catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}
		return komem;
	}
	
	public static void main(String[] args) {
		
	}
}
