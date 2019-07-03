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


@WebServlet("/UserAddRequest")
public class UserAddRequestController extends HttpServlet {
	static boolean flag=true;

private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAddRequestController() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
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
		       out.println("<title>Add Pickup Request</title>");
		       out.println("</head>");
		       out.print("<body>");
			
			String Address =request.getParameter("Address");
			String City =request.getParameter("City");
			String State =request.getParameter("State");
			String PickUpDate=request.getParameter("PickUpDate");
			String Slot =request.getParameter("Slot");
			
			String Email=(String)session.getAttribute("Email");
			
			
		
			UserAddRequest up=new UserAddRequest();
			
			up.setEmail(Email);
			up.setAddress(Address);
			up.setCity(City);
			up.setState(State);
			up.setPickUpDate(PickUpDate);
			up.setSlot(Slot);
			
			 int status= UserAddRequestDao.save(up);
			 if(status>0)
			 {
				 out.println("<script>alert('Yeah!! Your Request Submitted Successfully')</script>");
				/*
				 * out.println("<h3>Yeah!! Your Request Submitted Successfully</h3>");
				 * out.print("<br>");
				 */
		         request.getRequestDispatcher("UserAddRequest.jsp").include(request, response);  
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