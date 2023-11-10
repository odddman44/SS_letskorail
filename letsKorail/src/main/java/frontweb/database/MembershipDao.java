package frontweb.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import frontweb.vo.KoMember;

public class MembershipDao {
	
	public void addMember(KoMember member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DB.con(); // DB연결.
			if(conn != null) {
				String sql = "INSERT INTO koMember \r\n"
						+ "(member_id, name, password, birthdate, gender, phone, emailReceiv, email, address, membershipNumber)\r\n"
						+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, member.getName());
				pstmt.setString(2, member.getPassword());
				pstmt.setDate(3, new java.sql.Date(member.getBirthdate().getTime()));
				pstmt.setString(4, member.getGender());
				pstmt.setString(5, member.getPhone());
				pstmt.setString(6, member.getEmailReceiv());
				pstmt.setString(7, member.getEmail());
				pstmt.setString(8, member.getAddress());
				pstmt.setLong(9, member.getMembershipNumber());
				
				pstmt.executeUpdate(); // 데이터베이스에 데이터 삽입
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//연결 해제
			DB.close(null, pstmt, conn);
		}
	}

}
