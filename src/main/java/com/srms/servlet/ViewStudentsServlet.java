package com.srms.servlet;

import com.srms.dao.StudentDAO;
import com.srms.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/viewStudents")
public class ViewStudentsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        StudentDAO dao = new StudentDAO();

        List<Student> students = dao.getAllStudents();

        request.setAttribute("students", students);

        request.getRequestDispatcher("viewStudents.jsp").forward(request, response);
    }
}