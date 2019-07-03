  package com.SellJunkOnline.web.user;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserLoginDao {
	
	
	String sql="select * from users where Email=? and Password=?";
	String url= "jdbc:mysql://localhost:3306/SellJunkOnlinedb";
	String username="root";
	String password="root";
	public boolean check(String Email, String pass) {
		
		
				try {	
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection con=DriverManager.getConnection(url,username,password);
						PreparedStatement st=con.prepareCall(sql);
						st.setString(1, Email);
						st.setString(2,pass);
						ResultSet rs=st.executeQuery();
						if(rs.next())
						{
							return true;
						}
				} 
				
				catch (Exception e) {
					
					e.printStackTrace();
				}
				
			
				
		return false;
	}
	

}

