<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login - Student Result Management System</title>

    <style>
        body{
            font-family: Arial;
            background-color:#f4f4f4;
        }

        .login-box{
            width:300px;
            margin:100px auto;
            padding:20px;
            background:white;
            border-radius:5px;
            box-shadow:0px 0px 10px gray;
        }

        input{
            width:100%;
            padding:8px;
            margin:10px 0;
        }

        button{
            width:100%;
            padding:10px;
            background:#007BFF;
            color:white;
            border:none;
        }

        .error{
            color:red;
        }
    </style>

</head>

<body>

<div class="login-box">

<h2>Login</h2>

<%
String error = request.getParameter("error");
if(error != null){
%>

<p class="error">Invalid Username or Password</p>

<%
}
%>

<form action="login" method="post">

<input type="text" name="username" placeholder="Enter Username" required>

<input type="password" name="password" placeholder="Enter Password" required>

<button type="submit">Login</button>

</form>

</div>

</body>
</html>