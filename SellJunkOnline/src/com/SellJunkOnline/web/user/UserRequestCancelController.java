package com.SellJunkOnline.web.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UserRequestCancel")
public class UserRequestCancelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public UserRequestCancelController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session=request.getSession();
		if(session.getAttribute("Email")==null)
		{
			response.sendRedirect("welcome.jsp");
			
		}
		
		else
		{
			
			int requestid =	Integer.parseInt(request.getParameter("id"));
			
			UserRequestCancel up=new UserRequestCancel();
			up.setReq_id(requestid);
			
			 int status= UserRequestCancelDao.save(up);
			 if(status>0)
			 {
		         request.getRequestDispatcher("UserViewRequest.jsp").include(request, response);  
			 }
			 else{   
		        	RequestDispatcher rd=request.getRequestDispatcher("ErrorReg.jsp");  
		        	rd.forward(request, response);
			        }  
		}
	}

}
