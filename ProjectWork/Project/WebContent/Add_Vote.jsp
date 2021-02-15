<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
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
<title>Add Vote</title>
<link rel='stylesheet' href='styles.css'>
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
        <h2>Add Vote</h2>
        <form method='post' action='AddVote_dba.jsp'>
        <table>
			<tr>
			<th>ELECTION NAME </th>
			<th>CANDIDATE NAME</th>
			<th>CANDIDATE ID</th>
			<th>CANDIDATE PARTY</th>
			<th>VOTE CANDIDATE</th>
			</tr>
                        <%
                        try {
                			String election_input = request.getParameter("ele_name");
                			Class.forName("oracle.jdbc.driver.OracleDriver");
                			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
                					"epproject","project123");
                			
		
                			 String sql = "SELECT * FROM candidates WHERE c_ele_name = ?";
                			 PreparedStatement pst = con.prepareStatement(sql);
								pst.setString(1, election_input);
								ResultSet rs = pst.executeQuery();

								while(rs.next()){
                			 %>
                			 <tr>
                			 <td><%= rs.getString(4)  %></td>
							<td><%= rs.getString(1) %></td>
							<td><%= rs.getString(2) %></td>
							<td><%= rs.getString(3) %></td>
							<td>
					            <label for="voted"> Vote </label>
					            <input type="radio" name="voted" value=" <%= rs.getString(2) %>" id="voted">
					        </td>
							</tr>
   						<% 
								}
                		} catch (ClassNotFoundException e) {
                			// TODO Auto-generated catch block
                			e.printStackTrace();
                		} catch (SQLException e) {
                			// TODO Auto-generated catch block
                			e.printStackTrace();
                		}
                        %>  
          	</table>	
          	<input type='submit' value='Vote'>
          </form>
    </div>
</body>
</html>