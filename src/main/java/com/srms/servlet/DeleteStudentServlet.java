package com.srms.servlet;

import com.srms.dao.StudentDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;

@WebServlet("/deleteStudent")
public class DeleteStudentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        StudentDAO dao = new StudentDAO();

        dao.deleteStudent(id);

        response.sendRedirect("viewStudents");
    }
}