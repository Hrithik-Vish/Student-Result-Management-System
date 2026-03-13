<%@ page import="java.util.List" %>
<%@ page import="com.srms.model.Student" %>
<%@ page import="com.srms.dao.StudentDAO" %>

<%
    String username = (String) session.getAttribute("username");

    if(username == null){
        response.sendRedirect("login.jsp");
    }

    StudentDAO dao = new StudentDAO();
    List<Student> students = dao.getAllStudents();
%>

<!DOCTYPE html>
<html>
<head>
<title>Add Result</title>

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

input, select{
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

</style>

</head>

<body>

<div class="container">

<h2>Add Student Result</h2>

<form action="addResult" method="post">

<select name="studentId" required>

<option value="">Select Student</option>

<%
for(Student s : students){
%>

<option value="<%= s.getStudentId() %>">
<%= s.getName() %> (ID: <%= s.getStudentId() %>)
</option>

<%
}
%>

</select>

<input type="text" name="subject" placeholder="Enter Subject" required>

<input type="number" name="marks" placeholder="Enter Marks" required>

<button type="submit">Add Result</button>

</form>

<br>

<a href="dashboard.jsp">Back to Dashboard</a>

</div>

</body>
</html>
