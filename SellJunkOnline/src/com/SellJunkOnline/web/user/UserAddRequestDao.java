package com.SellJunkOnline.web.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserAddRequestDao {
	
	
	
	static String url= "jdbc:mysql://localhost:3306/SellJunkOnlinedb";
	static String username="root";
	static String password="root";
	static int user_id;
	//static String UserName,MobileNo;
	 public static int save(UserAddRequest pb)
	 {
	 int status=0;
	
			 try
		 {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection(url,username,password);
			
			String Email=(String)pb.getEmail();
			
			  String query="select * from users where Email=?";
			  PreparedStatement st=conn.prepareCall(query); 
			  st.setString(1,Email); 
			  ResultSet rs=st.executeQuery();
			  while(rs.next()) { 
				  
			 user_id=rs.getInt("id");

			  }
			
			
			
			PreparedStatement ps=conn.prepareStatement("insert into userpickuprequest(id,PickUpDate,Submitted,Slot,Address,State,City,Status,u_id) values(id,?,?,?,?,?,?,?,?)");
	        ps.setString(1,pb.getPickUpDate());
	        ps.setTimestamp(2, new java.sql.Timestamp(new java.util.Date().getTime()));
	        ps.setString(3,pb.getSlot());   
	        ps.setString(4,pb.getAddress());
	        ps.setString(5, pb.getState());
	        ps.setString(6,pb.getCity());
	        ps.setString(7,"Submitted");
	        ps.setInt(8,user_id);

	        status=ps.executeUpdate();   
	        conn.close();  
			}
		catch(Exception e)	{
				e.printStackTrace();
		}
		return status;
	 }
	

}
