<%@page import="java.util.List"%>
<%@page import="userDto.software"%>
<%@page import="userDao.SoftwareDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Software Request</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Center the form vertically and horizontally */
        .centered-form {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh; /* Full viewport height */
        }
    </style>
</head>
<body>
<nav class="navbar navbar-dark bg-primary">
  <div class="container">
      <!-- Navbar Heading -->
      <span class="navbar-brand mb-0 h1">User Management</span>
      <!-- Button -->
     <a href="login.jsp"> <button class="btn btn-primary ">LogOut</button></a>
  </div>
</nav>
    <div class="container centered-form">
        <div class="col-md-6">
            <h2 class="text-center">Software Request Form</h2>
            <%
            	String added=(String)request.getAttribute("added");
            	if(added!=null)
            		out.print("<p style='color:green'>"+added+"</p>");
            %>
            <form action="requestAccess" method="post" class="mt-4">
                <!-- Software Dropdown -->
                <div class="form-group">
                    <label for="software">Select Software</label>
                    <select class="form-control" id="software" name="software" required>
                        <% 
                            List<software> l = new SoftwareDao().fetchSoftware();
                            if(l != null) {
                                for(software s : l) {
                        %>
                                    <option value="<%= s.getId()+" "+s.getName() %>"><%=  s.getId()+" "+s.getName()%></option>
                        <% 
                                }
                            } else {
                        %>
                                    <option value="">No softwares currently</option>
                        <% 
                            }
                        %>
                    </select>
                </div>
                <div class="form-group">
                	<label for="access">Access type</label>
                	<select class="form-control" id="access" name="access">
                		<option value="read">read</option>
                		<option value="write">write</option>
                		<option value="admin">admin</option>
                	</select>
                </div>
                <!-- Reason Text Area -->
                <div class="form-group">
                    <label for="reason">Reason for Request</label>
                    <textarea class="form-control" id="reason" name="reason" placeholder="Enter your reason here..." rows="4" required></textarea>
                </div>
                
                <!-- Request Button -->
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Request</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
