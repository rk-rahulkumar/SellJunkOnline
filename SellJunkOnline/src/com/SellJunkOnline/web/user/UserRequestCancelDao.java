package com.SellJunkOnline.web.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;



public class UserRequestCancelDao {
	
	 public static int save(UserRequestCancel pb)
	 {
		int status=0;
				try 
				{
					Class.forName("com.mysql.jdbc.Driver");
					String url="jdbc:mysql://localhost/SellJunkOnlinedb";
					String username="root";
					String password="root";
					String query="update userpickuprequest set Status ='Canceled' where id=?";
					Connection conn=DriverManager.getConnection(url,username,password);
					PreparedStatement st=conn.prepareCall(query);
					st.setInt(1,pb.getReq_id());
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

