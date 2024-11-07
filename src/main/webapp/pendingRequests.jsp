<%@page import="userDto.users"%>
<%@page import="userDto.software"%>
<%@page import="userDto.requests"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="userDao.RequestsDao" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Access Requests</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-dark bg-primary">
  <div class="container">
      <span class="navbar-brand mb-0 h1">User Management</span>
     <a href="login.jsp"><button class="btn btn-primary">LogOut</button></a>
  </div>
</nav>
<div class="container mt-5">
    <h2 class="text-center">Pending Access Requests</h2>
    <form action="handleRequest" method="post">
        <table class="table table-bordered mt-4">
            <thead class="thead-light">
                <tr>
                    <th>ID</th>
                    <th>User ID</th>
                    <th>Software ID(s)</th>
                    <th>Access Type</th>
                    <th>Reason</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<requests> pendingRequests = new RequestsDao().getPendingRequests();
                    if (pendingRequests != null && !pendingRequests.isEmpty()) {
                        for (requests requ : pendingRequests) {
                            List<software> softwares = requ.getSoftware();
                            users user = requ.getUser();
                %>
                <tr>
                    <td><%= requ.getId() %></td>
                    <td><%= user != null ? user.getId() : "N/A" %></td> <!-- Null check for user -->
                    <td>
                        <% if (softwares != null) {
                            for (software sof : softwares) { %>
                                <div><%= sof.getId() %> - <%= sof.getName() %></div>
                        <%  }
                        } else { %>
                            <div>N/A</div>
                        <% } %>
                    </td>
                    <td><%= requ.getAccess_type() != null ? requ.getAccess_type() : "N/A" %></td>
                    <td><%= requ.getReason() != null ? requ.getReason() : "N/A" %></td>
                    <td>
                        <button type="submit" name="action" value="approve_<%= requ.getId() %>" class="btn btn-success btn-sm">Approve</button>
                        <button type="submit" name="action" value="reject_<%= requ.getId() %>" class="btn btn-danger btn-sm">Reject</button>
                    </td>
                </tr>
                <%      }
                    } else { %>
                    <tr>
                        <td colspan="6" class="text-center">No pending requests</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
