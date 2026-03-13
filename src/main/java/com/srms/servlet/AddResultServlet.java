package com.srms.servlet;

import com.srms.connection.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/addResult")
public class AddResultServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int studentId = Integer.parseInt(request.getParameter("studentId"));
        String subject = request.getParameter("subject");
        int marks = Integer.parseInt(request.getParameter("marks"));

        try {

            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO results(student_id, subject, marks) VALUES (?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, studentId);
            ps.setString(2, subject);
            ps.setInt(3, marks);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("viewResults.jsp");
    }
}