<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires","0");
	if(session == null || session.getAttribute("un") == null || session.getAttribute("pw") == null){
		response.sendRedirect("error.html");	
	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
<link rel='stylesheet' href='styles.css'>
<style>
	h2{
		color:green;
		font-family: monospace;
	}
</style>
</head>
<body>
<div class="sidebar">
        <a class='active' >Menu</a>
        <a href='profile.jsp'>Profile</a>
        <a href='addVote.jsp'>Add Vote</a>
         <a href='UserLogOut'>Log Out</a>
    </div>
    
    <div class='content'>
        <div id='topnav'>
            <p style='text-align: center; color:white; font-family: monospace; font-size: x-large;'>College Election System</p>
        </div>
        <h2> Profile</h2>
        <% 
        
      
		if(session != null) {
			out.println("<h2> Username :</h2>"+ session.getAttribute("un"));
			out.println("<h2> password :</h2>"+ session.getAttribute("pw"));
		}
		
        %>
    </div>
</body>
</html>