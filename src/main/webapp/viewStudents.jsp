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
<title>View Students</title>

<style>

body{
    font-family: Arial;
    background:#f4f4f4;
    text-align:center;
}

table{
    margin:40px auto;
    border-collapse: collapse;
    width:80%;
    background:white;
}

th, td{
    border:1px solid #ddd;
    padding:10px;
}

th{
    background:#007BFF;
    color:white;
}

a{
    text-decoration:none;
}

.edit{
    color:green;
}

.delete{
    color:red;
}

.btn{
    display:inline-block;
    margin-top:20px;
    padding:10px 15px;
    background:#007BFF;
    color:white;
}

</style>

</head>

<body>

<h2>Student List</h2>

<table>

<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Course</th>
<th>Edit</th>
<th>Delete</th>
</tr>

<%
for(Student s : students){
%>

<tr>
<td><%= s.getStudentId() %></td>
<td><%= s.getName() %></td>
<td><%= s.getEmail() %></td>
<td><%= s.getCourse() %></td>

<td>
<a class="edit" href="editStudent.jsp?id=<%= s.getStudentId() %>">Edit</a>
</td>

<td>
<a class="delete" href="deleteStudent?id=<%= s.getStudentId() %>">Delete</a>
</td>

</tr>

<%
}
%>

</table>

<br>

<a class="btn" href="dashboard.jsp">Back to Dashboard</a>

</body>
</html>