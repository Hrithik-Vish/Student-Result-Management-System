package com.srms.servlet;

import com.srms.dao.StudentDAO;
import com.srms.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;

@WebServlet("/updateStudent")
public class UpdateStudentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");

        Student student = new Student();
        student.setStudentId(id);
        student.setName(name);
        student.setEmail(email);
        student.setCourse(course);

        StudentDAO dao = new StudentDAO();

        boolean status = dao.updateStudent(student);

        if(status){
            response.sendRedirect("viewStudents");
        } else {
            response.sendRedirect("editStudent.jsp?id=" + id);
        }

    }
}