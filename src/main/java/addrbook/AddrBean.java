package addrbook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AddrBean {

	Connection conn = null;
	PreparedStatement pstmt = null;

	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1:3306/hanbit1";

	// DB연결 메서드
	void connect() {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "developer", "developer");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	void disconnect() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} // end if(pstmt != null)

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} // end if(conn != null)
	}

	// 수정된 주소록 내용 갱신을 위한 메서드
	public boolean updateDB(AddrBook addrbook) {
		connect();

		String sql = "update addrbook set ad_name=?, ad_email=?, ad_birth=?, ad_tel=?, ad_comdept=?, ad_memo=? where ad_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, addrbook.getAd_name());
			pstmt.setString(2, addrbook.getAd_email());
			pstmt.setString(3, addrbook.getAd_birth());
			pstmt.setString(4, addrbook.getAd_tel());
			pstmt.setString(5, addrbook.getAd_comdept());
			pstmt.setString(6, addrbook.getAd_memo());
			pstmt.setInt(7, addrbook.getAd_id());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		} // end try

		return true;
	}// end updateDB(AddrBook addrbook)

	// 특정 주소록 삭제 메서드
	public boolean deleteDB(int ad_id) {
		connect();

		String sql = "delete from addrbook where ad_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ad_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		} // end try

		return true;
	}// end deleteDB(int ad_id)

	// 신규 주소록을 추가하는 메서드
	public boolean insertDB(AddrBook addrbook) {
		connect();
		// ad_id는 DB에서 auto_increment이므로 입력하지 않는다.
		String sql = "insert into addrbook(ad_name, ad_email, ad_birth, ad_tel, ad_comdept, ad_memo)"
				+ "values(?,?,?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, addrbook.getAd_name());
			pstmt.setString(2, addrbook.getAd_email());
			pstmt.setString(3, addrbook.getAd_birth());
			pstmt.setString(4, addrbook.getAd_tel());
			pstmt.setString(5, addrbook.getAd_comdept());
			pstmt.setString(6, addrbook.getAd_memo());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		} // end try

		return true;
	}// end insertDB(AddrBook addrbook)

	// 특정 주소록을 가져오는 메서드
	public AddrBook getDB(int ad_id) {
		connect();

		String sql = "select * from addrbook where ad_id=?";
		AddrBook addrbook = new AddrBook();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ad_id);
			ResultSet rs = pstmt.executeQuery();

			// 데이터가 하나만 있으므로 rs.next()를 한번만 실행
			rs.next();
			addrbook.setAd_id(rs.getInt("ad_id"));
			addrbook.setAd_name(rs.getString("ad_name"));
			addrbook.setAd_email(rs.getString("ad_email"));
			addrbook.setAd_birth(rs.getString("ad_birth"));
			addrbook.setAd_tel(rs.getString("ad_tel"));
			addrbook.setAd_comdept(rs.getString("ad_comdept"));
			addrbook.setAd_memo(rs.getString("ad_memo"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		} // end try

		return addrbook;
	}// end getDB(int ad_id)

	// 전체 주소록을 가져오는 메서드
	public ArrayList<AddrBook> getDBList() {
		connect();

		ArrayList<AddrBook> datas = new ArrayList<>();

		String sql = "select * from addrbook order by ad_id dessc";

		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				AddrBook addrbook = new AddrBook();

				addrbook.setAd_id(rs.getInt("ad_id"));
				addrbook.setAd_name(rs.getString("ad_name"));
				addrbook.setAd_email(rs.getString("ad_email"));
				addrbook.setAd_birth(rs.getString("ad_birth"));
				addrbook.setAd_tel(rs.getString("ad_tel"));
				addrbook.setAd_comdept(rs.getString("ad_comdept"));
				addrbook.setAd_memo(rs.getString("ad_memo"));

				datas.add(addrbook);
			} // end while(rs.next())
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		} // end try

		return datas;
	}// end getDBList()
}