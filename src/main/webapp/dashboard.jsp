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
    <title>Dashboard</title>

    <style>

        body{
            font-family: Arial;
            background-color:#f4f4f4;
            text-align:center;
        }

        .container{
            margin-top:100px;
        }

        .btn{
            display:block;
            width:250px;
            margin:15px auto;
            padding:12px;
            background:#007BFF;
            color:white;
            text-decoration:none;
            border-radius:5px;
        }

        .logout{
            background:red;
        }

    </style>

</head>

<body>

<div class="container">

<h2>Welcome <%= username %></h2>

<a class="btn" href="addStudent.jsp">Add Student</a>

<a class="btn" href="viewStudents">View Students</a>

<a class="btn" href="addResult.jsp">Add Result</a>

<a class="btn" href="viewResults">View Results</a>

<a class="btn logout" href="logout">Logout</a>

</div>

</body>
</html>