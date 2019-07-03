package com.SellJunkOnline.web.user;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;





public class UserRegDao {
	
	static String url= "jdbc:mysql://localhost:3306/SellJunkOnlinedb";
	static String username="root";
	static String password="root";
	
	 public static int[] save(UserReg pb)
	 {
	 int status[]=new int[3];
	 int count=0;
			 try
		 {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection(url,username,password);
			Statement st=conn.createStatement();
			String Email=pb.getEmail();
			String strQuery = "SELECT COUNT(*) FROM users where Email='"+Email+"'";
			ResultSet rs = st.executeQuery(strQuery);
				while(rs.next())
				{
					count=rs.getInt(1);
				}
				if(count==0 && !pb.getCity().equals("SELECT CITY"))
				{
				PreparedStatement ps=conn.prepareStatement("insert into users(id,UserName,Gender,MobileNo,Email,Password,State,City,Address) values(id,?,?,?,?,?,?,?,?)");
		        ps.setString(1,pb.getUsername());
		        ps.setString(2,pb.getGender());
		        ps.setString(3,pb.getMobileNo());          
		        ps.setString(4,pb.getEmail());  
		        ps.setString(5,pb.getPassword());
		        ps.setString(6,pb.getState());
		        ps.setString(7,pb.getCity());   
		        ps.setString(8,pb.getAddress()); 
		        status[0]=ps.executeUpdate();   
		        conn.close();  
				}
				else if(pb.getCity().equals("SELECT CITY"))
				{
					status[2]=2;
					
				}
				else
				{
					status[1]=1;
				}
			}
		catch(Exception e)	{
				e.printStackTrace();
		}
		return status;
	 }

}
 