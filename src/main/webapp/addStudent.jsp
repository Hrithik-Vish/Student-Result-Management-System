<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
    String username = (String) session.getAttribute("username");

    if(username == null){
        response.sendRedirect("login.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Add Student</title>

<style>

body{
    font-family: Arial;
    background:#f4f4f4;
    text-align:center;
}

.container{
    width:400px;
    margin:100px auto;
    background:white;
    padding:20px;
    border-radius:5px;
}

input{
    width:100%;
    padding:8px;
    margin:10px 0;
}

button{
    width:100%;
    padding:10px;
    background:#28a745;
    color:white;
    border:none;
}

a{
    display:block;
    margin-top:10px;
}

</style>

</head>

<body>

<div class="container">

<h2>Add Student</h2>

<form action="addStudent" method="post">

<input type="text" name="name" placeholder="Enter Name" required>

<input type="email" name="email" placeholder="Enter Email" required>

<input type="text" name="course" placeholder="Enter Course" required>

<button type="submit">Add Student</button>

</form>

<a href="dashboard.jsp">Back to Dashboard</a>

</div>

</body>
</html>