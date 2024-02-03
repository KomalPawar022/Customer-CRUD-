////Delete this

package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.connection.DBConnection;
import com.dao.CustomerDao;


@WebServlet("/SearchCustomerController")
public class SearchCustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String sql=null;
    
    public SearchCustomerController() {
        super();  
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String[][] data = new String[100][8];
		 String searchBy = request.getParameter("searchBy");
		
		 String parameter=request.getParameter("parameter");
		 
		 
		 if(searchBy.equals("Search by"))
		 {
			 	
			 	out.println("<script type=\"text/javascript\">");
				out.println("alert('Select Correct Option')");
				out.println("location='CustomerList.jsp';");
				out.println("</script>");
		 }
		 else if(searchBy.equals("1"))
		 {
			 sql="Select * from Customer where first_name='"+parameter+"';";
		 }
		 else if(searchBy.equals("2"))
		 {
			 sql="Select * from Customer where city='"+parameter+"';";
		 }
		 else if(searchBy.equals("3"))
		 {
			 sql="Select * from Customer where email='"+parameter+"';";
		 }
		 else
		 {
			 sql="Select * from Customer where phone='"+parameter+"';";
		 }
		 Connection con = DBConnection.getConnection();
         Statement st;
		try {
			st = con.createStatement();
			ResultSet rs=st.executeQuery(sql);
			
			int i=0;
	         while(rs.next())
	         { 
	        	 data[i][0]=rs.getString(1);
	        	 data[i][1]=rs.getString(2);
	        	 data[i][2]=rs.getString(3);
	        	
	        	 data[i][3]=rs.getString(5);
	        	 data[i][4]=rs.getString(6);
	        	 data[i][5]=rs.getString(7);
	        	 data[i][6]=rs.getString(8);
	        	 data[i][7]=rs.getString(9);
	        	 
	        	 
	        	 System.out.println(data[i][0]+data[i][1]+data[i][2]+data[i][3]+data[i][4]+data[i][5]+data[i][6]);
	         }
	        
	         request.setAttribute("sql", sql);
	         RequestDispatcher dispatcher = request.getRequestDispatcher("CustomerList.jsp");
	         dispatcher.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
	}

}
