package com.controller;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.CustomerBean;
import com.dao.CustomerDao;


@WebServlet("/UpdateCustomerController")
public class UpdateCustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    
    public UpdateCustomerController() {
        super();  
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
//Will retrieve the data from the page and store in variables		
		String id=request.getParameter("customerId");
		String firstname=request.getParameter("firstName");
		String lastname=request.getParameter("lastName");
		String street=request.getParameter("street");
		
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		
// will create a CustomerBean and store the retrieved data in the bean		
		CustomerBean bean=new CustomerBean();
		bean.setuuid(id);
		bean.setFirstName(firstname);
		bean.setLastName(lastname);
		bean.setStreet(street);
		bean.setAddress(address);
		bean.setCity(city);
		bean.setState(state);
		bean.setEmail(email);
		bean.setPhone(phone);
		
		CustomerDao dao=new CustomerDao();
		boolean flag=dao.UpdateCustomerData(bean);
		if(flag)
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Successfully Updated Customer')");
			out.println("location='CustomerList.jsp';");
			out.println("</script>");
			
		}
		 
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
	}

}
