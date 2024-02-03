<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.connection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="com.bean.CustomerBean"%>
<%@page import="com.dao.CustomerDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- This is the page that opens after login, shows Customer data -->

<html>
  <head>
    <title>Customer List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <meta charset="UTF-8" />
  </head>

  <body>
  <%
  String searchBy=null;
  String parameter=null;

  %>
 
    <div class="container">
   <h3 class="text-center"> Customer List</h3>
   <div class="input-group mb-3 w-100 container">
   
    <button class="btn btn-primary w-35 mt-2 mr-2" id="add"  style="height:35px" onclick="window.open('./CustomerDetails.jsp', '_self')">
   Add Customer</button>
    <form id="SearchForm m-2" class="form" style="width:540px">
             	 
   <select class="form-select  w-25 m-2" style="display:inline;width:400px" name="searchBy" id="searchBy">
    <option selected>Search by</option>
    <option value="1">First Name</option>
    <option value="2">City</option>
    <option value="3">Email</option>
    <option value="4">Phone</option>
   </select>

    <input type="text" class="form-control m-2" style="display:inline;width:300px" name="parameter" id="parameter" aria-describedby="basic-addon2">
    <button class="btn btn-primary m-2" id="empty">🔎</button>
 </form> 
    <form id="SyncForm" action="SyncController" method="post">	    
    			
 <button class="btn btn-primary w-35 mt-2" style="height:40px" >Sync</button>
 </form>
  </div>


   <table class="table">
    <thead>
      <tr>
      
        <th>First Name</th>
        <th>Last Name</th>
        <th>Address</th>
        <th>City</th>
        <th>State</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Action  </th>
      </tr>
    </thead>
    <tbody>
 
       <%			
 //when the page opens for the first time the sql will be search all the Customers
       			searchBy = request.getParameter("searchBy");
   				parameter=request.getParameter("parameter");
   
   	
   					String sql=null;
       				Connection con = DBConnection.getConnection();
                     Statement st=con.createStatement();
                     if(searchBy==null)
                     {
                    	 sql="Select * from Customer;";
                     }
                     else  if(searchBy.equals("Search by"))
            		 {
 //Handling the error before hand when Search by is not selected
                    	 sql="Select * from Customer;";
                    	out.println("<script type=\"text/javascript\">");
         				out.println("alert('Select Correct Option')");
         				out.println("location='CustomerList.jsp';");
         				out.println("</script>");
         				 }
                     else if(searchBy.equals("1"))
            		 {
//If first option is selected the query will search the Customers who have First Name as specified in the input	 
            			 sql="Select * from Customer where first_name='"+parameter+"';";
            		 }
            		 else if(searchBy.equals("2"))
            		 {
//If second option is selected the query will search the Customers who have City as specified in the input	 
            			 sql="Select * from Customer where city='"+parameter+"';";
            		 }
            		 else if(searchBy.equals("3"))
            		 {
//If third option is selected the query will search the Customers who have Email as specified in the input	 
            			 sql="Select * from Customer where email='"+parameter+"';";
            		 }
            		 else
            		 {
//If forth option is selected the query will search the Customers who have Phone as specified in the input	 
            			 sql="Select * from Customer where phone='"+parameter+"';";
            		 }
                     ResultSet rs=st.executeQuery(sql);
                     while(rs.next())
                     { 
//The selected data is shown in the table
                     %>  
                          <TR class="row1">      	                     	
                    <form id="deleteForm" action="DeleteCustomerController" method="post">	    
    				<td hidden><input name="id" value='<%=rs.getString(1) %>'>
    				
    				</td>
					                   	
                    	 <td><%=rs.getString(2) %></td>
                    	 <td><%=rs.getString(3) %></td>
                    	 <td><%=rs.getString(5) %></td>
                    	  <td><%=rs.getString(6) %></td>
                    	   <td><%=rs.getString(7) %></td>
                    	    <td><%=rs.getString(8) %></td>
                    	     <td><%=rs.getString(9) %></td>
                    	     <td>
       
                   	  
 <button class="btn btn-danger" onclick="document.getElementById('deleteForm').submit()">🗑</button>
  </form>
    <button class="btn btn-success" onclick="window.location.href='UpdateDetails.jsp?value=<%=rs.getString(1)%>'">🖊</button>
<!-- When update button is clicked UpdateDetails page will open and uuid is send to that page -->
    </td>	        	 
                    </TR>                  	 
                    <% 
                   
                     } %> 
               
   
    </tbody>
   </table>
   </div>
 

  </body>
</html>