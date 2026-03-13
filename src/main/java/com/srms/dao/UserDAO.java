package com.srms.dao;

import com.srms.connection.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    public boolean validateUser(String username, String password){

        boolean status = false;

        try{

            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM users WHERE username=? AND password=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                status = true;
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }
}