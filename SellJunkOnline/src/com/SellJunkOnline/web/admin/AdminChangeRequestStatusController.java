package com.SellJunkOnline.web.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdminChangeRequestStatus")
public class AdminChangeRequestStatusController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AdminChangeRequestStatusController() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		HttpSession session=request.getSession();
		if(session.getAttribute("Email")==null)
		{
			response.sendRedirect("AdminLogin.jsp");
		}
		
		else
		{
			int requestid =	Integer.parseInt(request.getParameter("id"));
			String Status=request.getParameter("Status");
			
			AdminChangeRequestStatus up=new AdminChangeRequestStatus();
			up.setReq_id(requestid);
			up.setStatus(Status);
			
			 int status= AdminChangeRequestStatusDao.save(up);
			 if(status>0)
			 {
		         request.getRequestDispatcher("AdminViewRequest.jsp").include(request, response);  
			 }
			 else{   
		        	RequestDispatcher rd=request.getRequestDispatcher("ErrorReg.jsp");  
		        	rd.forward(request, response);
			        }  
		}
		
	}

	
}
