package com.khel.khelposhak.dao;

import java.sql.*;
import com.khel.khelposhak.databaseConnection.DatabaseConnection;
import com.khel.khelposhak.model.UserModel;

public class RegisterDao {
    
    public boolean registerUser(UserModel user) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO users (full_name, email, password, phone, address) VALUES (?,?,?,?,?)";
        
        try (Connection conn = DatabaseConnection.getDbConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getAddress());
            
            return ps.executeUpdate() > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
}