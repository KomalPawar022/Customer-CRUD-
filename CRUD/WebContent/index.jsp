<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <title>Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <meta charset="UTF-8" />
  </head>

  <body>
  
  
    <div id="app" class="form-group border border-primary w-50 container justify-content-center align-items-center mt-5 p-2">
    <h2>Login Page</h2>
    <input type="text" class="m-1 " id="login_id" placeholder="Login id"><br/>
    <input type="password" class="m-1" id="password" placeholder="Password"> <br/>
    <button class="btn btn-primary m-1" id="submit">Submit</button>
    </div>

    <script language="javascript">
    
//     authenticate function will run after clicking the submit button which will make an API Call for authentication
    
let submit=document.getElementById("submit");
submit.addEventListener("click",authenticate );
	async function authenticate() {		
		
		  let login_id = document.getElementById("login_id");
		    login_id=login_id.value;
		    
		    let password = document.getElementById("password");
		    password=password.value;
		  
		    
	  const response = await fetch(`https://qa.sunbasedata.com/sunbase/portal/api/assignment_auth.jsp`
			  , {
			    method: "POST",
			    headers: {
			      "Content-Type": "application/json",
			    },
			    body: JSON.stringify({
			      login_id,
			      password,
			    }),
			  });
	  // if response.ok is true, the API will return a bearer token which will be used in subsequent API calls.
			  if (response.ok) {
			    const data = await response.text();			   
			    let jsondata =JSON.parse(data);			    
			    const token = jsondata.access_token; 			   
			    localStorage.setItem("jwtToken", token); 			   
			    console.log("Authentication successful!");
			    window.open("./CustomerList.jsp", "_self");
			  } else {
			    const error = await response.text();
			    console.error("Authentication failed:", error);
			    console.log("Authentication failed.");
			    alert("Authentication Failed");
			  }
	}
	
</script>
  </body>
</html>
