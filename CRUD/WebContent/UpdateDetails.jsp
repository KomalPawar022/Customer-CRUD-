<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.connection.DBConnection"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- This is the page to modify the Customers information -->

<html>
  <head>
    <title>Customer Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <meta charset="UTF-8" />
  </head>

  <body>
  
  <%
 
  //Will fill all the inputs with the data retrieved from the database
  //Query is made using the uuid send from CustomerList Page
 
  	String firstName=null;
  	String lastName=null;
  	String street=null;
  	String address=null;
  	String city=null;
  	String state=null;
  	String email=null;
  	String phone=null;
    String value = request.getParameter("value");
    if (value != null) {
       
        Connection con = DBConnection.getConnection();
        Statement st=con.createStatement();
        String sql="select * from Customer Where uuid='"+value+"';";
        ResultSet rs=st.executeQuery(sql);
  
        
      
        while(rs.next())
        { 
        	firstName=rs.getString(2);
        	lastName=rs.getString(3);
        	street=rs.getString(4);
        	address=rs.getString(5);
        	city=rs.getString(6);
        	state=rs.getString(7);
        	email=rs.getString(8);
        	phone=rs.getString(9);
        	
        	
        }
       
    }
%>

 <!-- When submit is clicked control will go to UpdateCustomerController -->
 <!-- If any information is changed on the page it will be  updated in the database-->
 
    <div class="container form-group mt-3">
        <h3 class="text-center">Customer Details</h3>
        <form action="UpdateCustomerController" method="post">
        <input type="hidden" name="customerId" value="<%=value%>">
        <div class="row justify-content-center">
        <input class="col-3 m-2" name="firstName" placeholder="First Name" value="<%=firstName %>" required/>
        <input  class="col-3 m-2" name="lastName" placeholder="Last Name" value="<%=lastName %>" required/>
    </div>
    <div class="row justify-content-center">
        <input class="col-3 m-2" name="street" placeholder="Street" value="<%=street %>" />
        <input class="col-3 m-2" name="address" placeholder="Address" value="<%=address %>"/>
    </div>
    <div class="row justify-content-center">
        <input class="col-3 m-2" name="city" placeholder="City" value="<%=city %>" />
        <input class="col-3 m-2" name="state" placeholder="State" value="<%=state %>"/>
       
        </div>
        <div class="row justify-content-center">
        <input class="col-3 m-2" name="email" placeholder="Email" value="<%=email %>"/>
        <input class="col-3 m-2"  name="phone"  placeholder="Phone" value="<%=phone %>"/>
        </div>
        <div class="row justify-content-center">
        <button class="btn btn-primary w-25 m-2" id="submit">Submit</button>
        </div>
        </form>
       
  </div>
  </body>
</html>
