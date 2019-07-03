package com.SellJunkOnline.web.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/AdminLogin")
public class AdminLoginController extends HttpServlet {
	
	 
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String Email=request.getParameter("Email");
		String pass=request.getParameter("Password");
		AdminLoginDao dao=new AdminLoginDao();
		
		if(dao.check(Email, pass))
		{
			HttpSession session=request.getSession();
			session.setAttribute("Email",Email);
			response.sendRedirect("AdminViewRequest.jsp");
		}
		else
		{
			String message = "Invalid Email or Password";
			request.getSession().setAttribute("message", message);
			response.sendRedirect("AdminLogin.jsp");
			
		}
		
	}

	 

}
