package com.SellJunkOnline.web.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserRequestEditDao {
	

	static String url= "jdbc:mysql://localhost:3306/SellJunkOnlinedb";
	static String username="root";
	static String password="root";
	//static int user_id;
	//static String UserName,MobileNo;
	 public static int save(UserRequestEdit pb)
	 {
	 int status=0;
	
			 try
		 {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection(url,username,password);
			
			int requestid=pb.getReq_id();
			String Address=pb.getAddress();
			String State=pb.getState();
			String City=pb.getCity();
			String PickUpDate=pb.getPickUpDate();
			String Slot=pb.getSlot();
			
			  String query="update userpickuprequest set PickUpDate=?,Address =?,State=?,City=?,Slot=?  where id=?";
			  PreparedStatement st=conn.prepareCall(query); 
			  st.setString(1,PickUpDate);
			  st.setString(2,Address);
			  st.setString(3,State);
			  st.setString(4,City);
			  st.setString(5,Slot);
			  st.setInt(6,requestid); 
			  //ResultSet rs=st.executeQuery();
			  status=st.executeUpdate();   
			  conn.close();  
			}
		catch(Exception e)	{
				e.printStackTrace();
		}
		return status;
	 }
	

	
	

}
