package com.SellJunkOnline.web.admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class AdminChangeRequestStatusDao {
	
	
	
	 public static int save(AdminChangeRequestStatus pb)
	 {
		int status=0;
				try 
				{
					Class.forName("com.mysql.jdbc.Driver");
					String url="jdbc:mysql://localhost/SellJunkOnlinedb";
					String username="root";
					String password="root";
					String query="update userpickuprequest set Status =? where id=?";
					Connection conn=DriverManager.getConnection(url,username,password);
					PreparedStatement st=conn.prepareCall(query);
					st.setString(1,pb.getStatus());
					st.setInt(2,pb.getReq_id());
					status=st.executeUpdate();
					//response.sendRedirect("UserViewRequest.jsp");
				    st.close();
				    conn.close();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			return status;
	}

}
