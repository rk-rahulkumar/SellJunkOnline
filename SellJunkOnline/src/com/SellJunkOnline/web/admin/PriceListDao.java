package com.SellJunkOnline.web.admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class PriceListDao {
	
	static String url= "jdbc:mysql://localhost:3306/SellJunkOnlinedb";
	static String username="root";
	static String password="root";
	
	 public static int save(PriceList pb)
	 {
	 int status=0;
	
			 try
		 {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection(url,username,password);
			PreparedStatement ps=conn.prepareStatement("insert into PriceList(id,JunkName,Price,Unit) values(id,?,?,?)");
		
	        ps.setString(1,pb.getJunkName());
	        ps.setString(2,pb.getPrice());
	        ps.setString(3,pb.getUnit());
	        status=ps.executeUpdate();   
	        conn.close();  
			}
		catch(Exception e)	{
				e.printStackTrace();
		}
		return status;
	 }

}
