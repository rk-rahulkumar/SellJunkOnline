package com.SellJunkOnline.web.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UserRequestEdit")
public class UserRequestEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UserRequestEditController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		

		HttpSession session=request.getSession();
		if(session.getAttribute("Email")==null)
		{
			response.sendRedirect("welcome.jsp");
		}
		

		else
		{
			PrintWriter out=response.getWriter();
			response.setContentType("text/html");
			   out.println("<html>");
			   out.println("<head>");
		       out.println("<title>Edit Pickup Request</title>");
		       out.println("</head>");
		       out.print("<body>");
		      
		    int requestid =	Integer.parseInt(request.getParameter("id"));
			String Address =request.getParameter("Address");
			String City =request.getParameter("City");
			String State =request.getParameter("State");
			String PickUpDate=request.getParameter("PickUpDate");
			String Slot =request.getParameter("Slot");
			
			
			

			UserRequestEdit up=new UserRequestEdit();
			
			up.setReq_id(requestid);
			up.setAddress(Address);
			up.setCity(City);
			up.setState(State);
			up.setPickUpDate(PickUpDate);
			up.setSlot(Slot);
			
			 int status= UserRequestEditDao.save(up);
			 if(status>0)
			 {
				 out.println("<script>alert('Yeah!! Your Request Edited Successfully!')</script>");
				/*
				 * out.println("<h3>Yeah!! Your Request Edited Successfully</h3>");
				 * out.print("<br>");
				 */
		         request.getRequestDispatcher("UserViewRequest.jsp").include(request, response);  
			 }
			 else{   
		        	RequestDispatcher rd=request.getRequestDispatcher("ErrorReg.jsp");  
		        	rd.forward(request, response);
			        }  
			 
			   out.close();  
			    
				
			   out.print("<br"
					+ "></body>");
			   out.print("</html>");
		
		}

	}
}