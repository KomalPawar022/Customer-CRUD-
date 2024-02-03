<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- This the page for Add Customer -->

<html>
  <head>
    <title>Customer Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <meta charset="UTF-8" />
  </head>

  <body>
  
    <div class="container form-group mt-3">
        <h3 class="text-center">Customer Details</h3>
<!-- The program will execute CreateCustomerController after Submit is clicked -->
        <form action="CreateCustomerController" method="post">
        <div class="row justify-content-center">
        <input class="col-3 m-2" name="firstName" placeholder="First Name" required/>
        <input  class="col-3 m-2" name="lastName" placeholder="Last Name"  required/>
    </div>
    <div class="row justify-content-center">
        <input class="col-3 m-2" name="street" placeholder="Street" />
        <input class="col-3 m-2" name="address" placeholder="Address"/>
    </div>
    <div class="row justify-content-center">
        <input class="col-3 m-2" name="city" placeholder="City"/>
        <input class="col-3 m-2" name="state" placeholder="State"/>
       
        </div>
        <div class="row justify-content-center">
        <input class="col-3 m-2" name="email" placeholder="Email"/>
        <input class="col-3 m-2"  name="phone"  placeholder="Phone"/>
        </div>
        <div class="row justify-content-center">
        <button class="btn btn-primary w-25 m-2" id="submit">Submit</button>
        </div>
        </form>
       
  </div>

  </body>
</html>
