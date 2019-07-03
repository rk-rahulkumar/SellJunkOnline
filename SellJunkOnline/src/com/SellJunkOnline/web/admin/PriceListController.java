package com.SellJunkOnline.web.admin;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/AddPriceList")
public class PriceListController extends HttpServlet {
	


	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PriceListController() {
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
		
		
		
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		   out.println("<html>");
		   out.println("<head>");
	       out.println("<title>Add Price List</title>");
	       out.println("</head>");
	       out.print("<body>");
		
		String JunkName =request.getParameter("JunkName");
		String Price=request.getParameter("Price");
		String Unit=request.getParameter("Unit");	
		
		PriceList up=new PriceList();
		
		up.setJunkName(JunkName);
		up.setPrice(Price);
		up.setUnit(Unit);
		
		 int status= PriceListDao.save(up);
		 if(status>0)
		 {
			 out.println("<script>alert('Yeah !! Price Added Successfully!')</script>");
			/*
			 * out.println("<h2>Price Added Successfully!</h2>"); out.print("<br>");
			 * out.println("<h3>Add More Prices</h3>"); out.print("<br>");
			 */
	         request.getRequestDispatcher("AddPriceList.jsp").include(request, response);  
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
