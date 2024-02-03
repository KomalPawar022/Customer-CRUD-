package com.controller;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.dao.CustomerDao;


@WebServlet("/DeleteCustomerController")
public class DeleteCustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String id;
    
    public DeleteCustomerController() {
        super();  
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
//Will retrieve uuid from the page from the input that is hidden		
		 id = request.getParameter("id");
		
		 
		 CustomerDao dao=new CustomerDao();
		 boolean flag=dao.DeleteCustomerData(id);
			if(flag)
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Successfully Deleted Customer')");
				out.println("location='CustomerList.jsp';");
				out.println("</script>");
				
			}
		 
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
	}

}
