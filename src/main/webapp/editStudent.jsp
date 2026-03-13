<%@ page import="com.srms.model.Student" %>
<%@ page import="com.srms.dao.StudentDAO" %>

<%
    String username = (String) session.getAttribute("username");

    if(username == null){
        response.sendRedirect("login.jsp");
    }

    int id = Integer.parseInt(request.getParameter("id"));

    StudentDAO dao = new StudentDAO();
    Student student = dao.getStudentById(id);
%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Student</title>

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
    background:#007BFF;
    color:white;
    border:none;
}

</style>

</head>

<body>

<div class="container">

<h2>Edit Student</h2>

<form action="updateStudent" method="post">

<input type="hidden" name="id" value="<%= student.getStudentId() %>">

<input type="text" name="name" value="<%= student.getName() %>" required>

<input type="email" name="email" value="<%= student.getEmail() %>" required>

<input type="text" name="course" value="<%= student.getCourse() %>" required>

<button type="submit">Update Student</button>

</form>

<br>

<a href="viewStudents">Back to Student List</a>

</div>

</body>
</html>