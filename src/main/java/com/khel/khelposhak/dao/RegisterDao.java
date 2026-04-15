package com.khel.khelposhak.dao;

import java.sql.*;
import com.khel.khelposhak.databaseConnection.DatabaseConnection;
import com.khel.khelposhak.model.UserModel;

public class RegisterDao {

    private Connection conn;
    private boolean isConnectionError = false;

    public RegisterDao() {
        try {
            conn = DatabaseConnection.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            isConnectionError = true;
            System.out.println(ex.getMessage());
        }
    }

    public boolean registerUser(UserModel user) {

        try {
            String sql = "INSERT INTO users (full_name, email, password, phone, address) VALUES (?,?,?,?,?)";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, user.getFullName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getAddress());

            return ps.executeUpdate() > 0;

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }
}