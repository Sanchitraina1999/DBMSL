import java.sql.*;
import java.util.*;

public class JDBC {
	
		static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
	   static final String DB_URL = "jdbc:mysql://localhost/";

	   //  Database credentials
	   static final String USER = "root";
	   static final String PASS = "root";
	   public static void main(String[] args) throws SQLException, ClassNotFoundException {
		   Connection conn = null;
		   Statement stmt = null;
		   ResultSet rs = null;
		   String sql;
		   Scanner in = new Scanner(System.in);
		   try{
		      Class.forName(JDBC_DRIVER);
		      
		      System.out.println("Connecting to database...");
		      conn = DriverManager.getConnection(DB_URL, USER, PASS);
		      stmt = conn.createStatement();
		      
		      
		      String dbname = "second31155";
		      
      /*DATABASE CREATION*/
		      System.out.println("CREATING DATABASE "+dbname+"...");
		      sql = "CREATE DATABASE "+dbname;
		      stmt.executeUpdate(sql);
		      
		      sql="USE "+dbname;
		      stmt.execute(sql);
		      
      /*TABLE CREATIONS*/
		      System.out.println("CREATING TABLE Departments...");
		      sql = "CREATE TABLE Departments( "
		      		+ "dept_id int NOT NULL,"
		      		+ "dept_name varchar(16) NOT NULL,"
		      		+ "PRIMARY KEY(dept_id)"
		      		+ ");";
		      stmt.execute(sql);
		      
		      System.out.println("CREATING TABLE Professors...");
		      sql="CREATE TABLE Professors" + 
		      		"(" + 
		      		"    prof_id int NOT NULL," + 
		      		"    prof_fname varchar(16) NOT NULL," + 
		      		"    prof_lname varchar(16) NOT NULL," + 
		      		"    dept_id int NOT NULL," + 
		      		"    designation varchar(32) NOT NULL," + 
		      		"    salary int NOT NULL," + 
		      		"    doj DATE NOT NULL," + 
		      		"    email varchar(32) NOT NULL," + 
		      		"    phone varchar(10) NOT NULL," + 
		      		"    city varchar(16) NOT NULL," + 
		      		"    PRIMARY KEY (prof_id)," + 
		      		"    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id) ON DELETE CASCADE ON UPDATE CASCADE" + 
		      		");";
		      stmt.execute(sql);
		      
		      System.out.println("CREATING TABLE works...");
		      sql = "CREATE TABLE works\r\n" + 
			      		"(" + 
			      		"    prof_id int NOT NULL," + 
			      		"    dept_id int NOT NULL," + 
			      		"    duration int NOT NULL," + 
			      		"    FOREIGN KEY (prof_id) REFERENCES Professors(prof_id) ON DELETE CASCADE ON UPDATE CASCADE," + 
			      		"    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id) ON DELETE CASCADE ON UPDATE CASCADE" + 
			      		");";
		      
		      stmt.execute(sql);
		      
		      System.out.println("CREATING TABLE Shift...");
		      sql = "CREATE TABLE Shift" + 
		      		"(" + 
		      		"    prof_id int NOT NULL," + 
		      		"    shift varchar(16) NOT NULL," + 
		      		"    working_hours varchar(16) NOT NULL," + 
		      		"    FOREIGN KEY (prof_id) REFERENCES Professors(prof_id) ON DELETE CASCADE ON UPDATE CASCADE," + 
		      		"    PRIMARY KEY (prof_id, shift,working_hours)" + 
		      		");";
		      stmt.execute(sql);
		      
      /*DATA INSERTION*/
		      
		      System.out.println("INSERTING DATA INTO TABLE Departments...");
		      sql = "INSERT INTO Departments" + 
					"    (dept_id, dept_name)" + 
					"VALUES" + 
					"    (1, 'Computer')," + 
					"    (2, 'IT')," + 
					"    (3, 'EnTC')"
					+ ";";
		      stmt.execute(sql);
		      
		      
		      System.out.println("INSERTING DATA INTO TABLE Professors...");
			  sql = "INSERT INTO Professors" + 
			  		"    (prof_id,prof_fname,prof_lname,dept_id,designation,salary,doj,email,phone,city)" + 
			  		"VALUES" + 
			  		"    (1, 'Binod', 'binod', 1, 'Professor', 25000, '2015-01-01', 'abc@gmail.com', 9149589875, 'jammu')," + 
			  		"    (2, 'Sahil', 'Singh', 2, 'Assistant Professor', 30000, '2016-01-01', 'xyz@gmail.com', 9149656875, 'pune')," + 
			  		"    (3, 'Sanchit', 'Raina', 3, 'Professor', 19000, '2016-01-01', 'def@gmail.com', 9149459875, 'mumbai')," + 
			  		"    (4, 'Rajwinder', 'Singh', 1, 'Professor', 35000, '2015-01-01', 'stu@gmail.com', 9154659875, 'mumbai')," + 
			  		"    (5, 'Tejas', 'Sarawade', 2, 'Professor', 20000, '2016-01-01', 'jkl@gmail.com', 9144579875, 'pune')," + 
			  		"    (6, 'Sam', 'Jagdale', 3, 'Assistant Professor', 40000, '1999-12-26', 'ghi@gmail.com', 9145759875, 'pune')," + 
			  		"    (7, 'Pradyumna', 'Rajje', 2, 'Assistant Professor', 9000, '2016-01-01', 'vwx@gmail.com', 9197569875, 'mumbai')," + 
			  		"    (8, 'Ayush', 'Raina', 3, 'Professor', 18000, '2015-01-01', 'mno@gmail.com', 9145459875, 'mumbai')," + 
			  		"    (9, 'Abhishek', 'Dhar', 1, 'Assistant Professor', 50000, '1997-12-08', 'zyx@gmail.com', 9164659875, 'mumbai')," + 
			  		"    (10, 'Danish', 'Bhat', 2, 'Professor', 15000, '2015-01-01', 'pqr@gmail.com', 9149654875, 'pune');";
			  stmt.execute(sql);
			  
		      
		      System.out.println("INSERTING DATA INTO TABLE works...");
		      sql = "INSERT INTO works" + 
		      		"    (prof_id, dept_id, duration)" + 
		      		"VALUES" + 
		      		"    (1, 1, 5)," + 
		      		"    (2, 2, 4)," + 
		      		"    (3, 3, 4)," + 
		      		"    (4, 1, 5)," + 
		      		"    (5, 2, 4)," + 
		      		"    (6, 3, 20)," + 
		      		"    (7, 2, 4)," + 
		      		"    (8, 3, 5)," + 
		      		"    (9, 1, 23)," + 
		      		"    (10, 2, 5);";
		      stmt.execute(sql);
		      
		      
		      System.out.println("INSERTING DATA INTO TABLE Shifts...");
		      sql = "INSERT INTO Shift" + 
		      		"    (prof_id,shift,working_hours)" + 
		      		"VALUES\r\n" + 
		      		"    (1, 'Morning', 8)," + 
		      		"    (2, 'Evening', 8)," + 
		      		"    (3, 'Morning', 7)," + 
		      		"    (4, 'Evening', 8)," + 
		      		"    (5, 'Morning', 6)," + 
		      		"    (6, 'Evening', 9)," + 
		      		"    (7, 'Morning', 8)," + 
		      		"    (8, 'Evening',10)," + 
		      		"    (9, 'Morning', 8)," + 
		      		"    (10,'Evening', 8);" + 
		      		"";
		      stmt.execute(sql);
		      
		      
      /*VIEW*/
		      	sql = "CREATE VIEW simple_view AS SELECT prof_fname FROM Professors;";
	            stmt.executeUpdate(sql);
	            sql = "SELECT * FROM simple_view;";
	            rs = stmt.executeQuery(sql);
	            System.out.println("____prof_fname___[by using VIEW]");
	            while(rs.next()){
	                System.out.println(rs.getString(1));
	            }
	            sql = "DROP VIEW simple_view;";
	            stmt.executeUpdate(sql);  
	            
       /*INDEX*/
	            sql = "CREATE UNIQUE INDEX dept_name ON Departments(dept_name);";
	            stmt.executeUpdate(sql);	            
	            
	            sql="SELECT * FROM Departments use index(dept_name);";
	            rs = stmt.executeQuery(sql);
	            
	            System.out.println("Departments [by using INDEX]");
	            while(rs.next()) {
	            	 System.out.println(rs.getString(1)+" "+rs.getString(2));
	            }
	            sql="DROP INDEX dept_name ON Departments";
	            stmt.executeUpdate(sql);
	            
		   }finally{
			   System.out.println("DROPPING database...");
			   sql = "DROP DATABASE second31155;";
			   stmt.executeUpdate(sql);
			   stmt.close();
			   conn.close();
			   in.close();
		   }
		}
	}