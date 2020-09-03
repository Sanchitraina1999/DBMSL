import java.sql.*;

public class JDBC {
	public static void main(String[] args) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/second31155","root","root");
		
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("Select * from Departments where dept_id=1");
		
		rs.next();
		int dept_id=rs.getInt("Dept_id");
		String dept_name=rs.getString("Dept_Name");
		System.out.println(dept_id+" "+ dept_name);
		st.close();
		con.close();
	}
}
