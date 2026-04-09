
package com.khel.khelposhak.databaseConnection;
    
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {


    
	private static final String DB_NAME = "khelposhak";  
	private static final String URL = "jdbc:mysql://localhost:3306/" + DB_NAME;
	private static final String USERNAME = "root";
	private static final String PASSWORD = "";

	public static Connection getDbConnection() throws SQLException, ClassNotFoundException {
		return DriverManager.getConnection(URL, USERNAME, PASSWORD);
	}
}

