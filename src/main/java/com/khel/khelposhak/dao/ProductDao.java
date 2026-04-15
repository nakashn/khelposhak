package com.khel.khelposhak.dao;

import com.khel.khelposhak.databaseConnection.DatabaseConnection;
import java.sql.Connection;
import java.sql.SQLException;

public class ProductDao {

    private Connection con;
    private boolean isConnectionError = false;

    public ProductDao() throws ClassNotFoundException {
        try {
            con = DatabaseConnection.getDbConnection();
        } catch (SQLException ex) {
            isConnectionError = true;
            System.out.println(ex.getMessage());

        }
    
    }
    
}