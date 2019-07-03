 package com.SellJunkOnline.web.user;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/UserReg")
public class UserRegController extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegController() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		   out.println("<html>");
		   out.println("<head>");
	       out.println("<title>User Login</title>");
	       out.println("</head>");
	       out.print("<body>");
		
		String UserName =request.getParameter("UserName");
		String Gender=request.getParameter("Gender");
		String MobileNo =request.getParameter("MobileNo");
		String Email =request.getParameter("Email");
		String Password =request.getParameter("Password");
		String State =request.getParameter("State");
		String City =request.getParameter("City");
		String Address =request.getParameter("Address");
		
		UserReg up=new UserReg();
		
		up.setUsername(UserName);
		up.setGender(Gender);
		up.setMobileNo(MobileNo);
		up.setEmail(Email);
		up.setPassword(Password);
		up.setState(State);
		up.setCity(City);
		up.setAddress(Address);
		
		 int status[]= UserRegDao.save(up);
		 if(status[0]>0)
		 {
			 out.println("<script>alert('Account Registered successfully!')</script>");
			/*
			 * out.println("<h3>Registered successfully!</h3>"); out.print("<br>");
			 */
	         request.getRequestDispatcher("welcome.jsp").include(request, response);  
		 }
		 else if(status[1]==1)
		 {
			 out.println("<script>alert('Email Id Already In Use')</script>");
			/* out.println("<h3>Email Id Already In Use</h3>"); */
			 request.getRequestDispatcher("UserRegister.jsp").include(request, response);
		 }
		 else if(status[2]==2)
		 {
			 out.println("<script>alert('Please  Select State and City')</script>");
			/* out.println("<h3>Email Id Already In Use</h3>"); */
			 request.getRequestDispatcher("UserRegister.jsp").include(request, response);
		 }
		 else
		 {   
	        RequestDispatcher rd=request.getRequestDispatcher("ErrorReg.jsp");  
	        rd.forward(request, response);
		 }  
		 
		   out.close();  
		    
			
		   out.print("<br"
				+ "></body>");
		   out.print("</html>");
	}

	

}
