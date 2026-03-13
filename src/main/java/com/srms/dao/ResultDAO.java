package com.srms.dao;

import com.srms.connection.DBConnection;
import com.srms.model.Result;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ResultDAO {

    public boolean addResult(Result result){

        boolean status = false;

        try{

            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO results(student_id, subject, marks) VALUES (?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, result.getStudentId());
            ps.setString(2, result.getSubject());
            ps.setInt(3, result.getMarks());

            int rows = ps.executeUpdate();

            if(rows > 0){
                status = true;
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }
}