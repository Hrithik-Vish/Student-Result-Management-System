<%@ page import="java.sql.*" %>
<%@ page import="com.srms.connection.DBConnection" %>

<%
    String username = (String) session.getAttribute("username");

    if(username == null){
        response.sendRedirect("login.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>View Results</title>

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

.btn{
    display:inline-block;
    margin-top:20px;
    padding:10px 15px;
    background:#007BFF;
    color:white;
    text-decoration:none;
}

</style>

</head>

<body>

<h2>Student Results</h2>

<table>

<tr>
<th>Student ID</th>
<th>Student Name</th>
<th>Subject</th>
<th>Marks</th>
</tr>

<%

try{

    Connection con = DBConnection.getConnection();

    String query = "SELECT s.student_id, s.name, r.subject, r.marks "
                 + "FROM students s "
                 + "JOIN results r ON s.student_id = r.student_id";

    PreparedStatement ps = con.prepareStatement(query);

    ResultSet rs = ps.executeQuery();

    while(rs.next()){

%>

<tr>

<td><%= rs.getInt("student_id") %></td>
<td><%= rs.getString("name") %></td>
<td><%= rs.getString("subject") %></td>
<td><%= rs.getInt("marks") %></td>

</tr>

<%

    }

}catch(Exception e){
    e.printStackTrace();
}

%>

</table>

<br>

<a class="btn" href="dashboard.jsp">Back to Dashboard</a>

</body>
</html>