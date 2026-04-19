package com.srms.dao;

import com.srms.connection.DBConnection;
import com.srms.model.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

    // CREATE (Insert Student)
    public boolean addStudent(Student student) {

        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO students(name, email, course) VALUES (?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, student.getName());
            ps.setString(2, student.getEmail());
            ps.setString(3, student.getCourse());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }


    // READ (View All Students)
    public List<Student> getAllStudents() {

        List<Student> students = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM students";

            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {

                Student student = new Student();

                student.setStudentId(rs.getInt("student_id"));
                student.setName(rs.getString("name"));
                student.setEmail(rs.getString("email"));
                student.setCourse(rs.getString("course"));

                students.add(student);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return students;
    }


    // UPDATE Student
    public boolean updateStudent(Student student) {

        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String query = "UPDATE students SET name=?, email=?, course=? WHERE student_id=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, student.getName());
            ps.setString(2, student.getEmail());
            ps.setString(3, student.getCourse());
            ps.setInt(4, student.getStudentId());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // GET Student by ID
    public Student getStudentById(int id) {

        Student student = null;

        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM students WHERE student_id=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                student = new Student();

                student.setStudentId(rs.getInt("student_id"));
                student.setName(rs.getString("name"));
                student.setEmail(rs.getString("email"));
                student.setCourse(rs.getString("course"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return student;
    }

    // DELETE Student (and their results first to avoid FK constraint violation)
    public boolean deleteStudent(int studentId) {

        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            // Step 1: delete all results belonging to this student first
            String deleteResults = "DELETE FROM results WHERE student_id=?";
            PreparedStatement ps1 = con.prepareStatement(deleteResults);
            ps1.setInt(1, studentId);
            ps1.executeUpdate();
            ps1.close();

            // Step 2: now safe to delete the student
            String deleteStudent = "DELETE FROM students WHERE student_id=?";
            PreparedStatement ps2 = con.prepareStatement(deleteStudent);
            ps2.setInt(1, studentId);

            int rows = ps2.executeUpdate();
            ps2.close();

            if (rows > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

}
