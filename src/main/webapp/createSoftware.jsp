<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Software</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Center the form vertically */
        .centered-form {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-dark bg-primary">
    <div class="container">
        <span class="navbar-brand mb-0 h1">Admin</span>
        <div>
            <!-- <a href="showManagers.jsp" class="btn btn-light mr-2">Show Managers</a>
            <a href="showEmployees.jsp" class="btn btn-light mr-2">Show Employees</a> -->
            <a href="login.jsp" class="btn btn-danger">Logout</a>
        </div>
    </div>
</nav>

<div class="container centered-form">
    <div class="col-md-6">
        <h2 class="text-center">Create Software</h2>
        <form action="createSoftware" method="post">
            <!-- ID Field -->
            <!-- <div class="form-group">
                <label for="id">Software ID</label>
                <input type="number" class="form-control" id="id" name="id" placeholder="Enter Software ID" required>
            </div> -->
            <div class="form-group">
                <label for="name">Software Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Enter Software Name" required>
                <p id="errorsoft"></p>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea class="form-control" id="description" name="description" placeholder="Enter Description" rows="3" required></textarea>
                <p id="errordesc"></p>
            </div>
            <div class="form-group">
                <label for="accessLevel">Access Level</label>
                <select class="form-control" id="accessLevel" name="accessLevel" required>
                    <option value="">Select Access Level</option>
                    <option value="Read">Read</option>
                    <option value="Write">Write</option>
                    <option value="Admin">Admin</option>
                </select>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Create Software</button>
            </div>
            <%
                String success = (String) request.getAttribute("success");
                if (success != null) {
                    out.print("<p style='color:green'>" + success + "</p>");
                }
            %>
        </form>
    </div>
</div>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script type="text/javascript">
	let nameEl=document.getElementById("name");
	let descriptionEl=document.getElementById("description");
	
	let errorsoftEl=document.getElementById("errorsoft");
	let errordescEl=document.getElementById("errordesc");
	
	
	nameEl.addEventListener("blur",function(){
		if(nameEl.value===""){
			errorsoftEl.textContent="*required";
			errorsoftEl.style.color="red";
		}
		else{
			errorsoftEl.textContent="";
		}
	});
	descriptionEl.addEventListener("blur",function(){
		if(nameEl.value===""){
			errordescEl.textContent="*required";
			errordescEl.style.color="red";
		}
		else{
			errordescEl.textContent="";
		}
	});
		
	</script>
</body>
</html>
