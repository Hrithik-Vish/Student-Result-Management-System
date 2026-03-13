package com.srms.servlet;

import com.srms.dao.StudentDAO;
import com.srms.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;

@WebServlet("/addStudent")
public class AddStudentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");

        // Create Student object
        Student student = new Student();
        student.setName(name);
        student.setEmail(email);
        student.setCourse(course);

        // Call DAO
        StudentDAO dao = new StudentDAO();

        boolean status = dao.addStudent(student);

        if(status){
            response.sendRedirect("viewStudents");
        } else {
            response.sendRedirect("addStudent.jsp?error=1");
        }

    }
}