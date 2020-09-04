import java.sql.*;

public class JDBC {
	public static void main(String[] args) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/second31155","root","root");
		
		
//		VIEW FOR -
//		2. Display all professors details with city pune and mumbai and professor first name starting with
//		a' or 'd'.

		
		Statement st = con.createStatement();
		int rs = st.executeUpdate("CREATE VIEW prof_pune_mumbai_a_d AS\r\n" + 
				"		SELECT * FROM Professors\r\n" + 
				"		WHERE ((city='pune' or city='mumbai') and (prof_fname like 'a%' or prof_fname like 'd%'));");
		
//		rs.next();
//		int dept_id=rs.getInt("Dept_id");
//		String dept_name=rs.getString("Dept_Name");
//		System.out.println(dept_id+" "+ dept_name);
		
		st.close();
		con.close();
	}
}
