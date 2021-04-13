package com.openclassrooms.paymybuddy.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseConfig {

	public Connection getConnection() throws SQLException {

		try {
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return DriverManager.getConnection("jdbc:postgresql://localhost/appli_bancaire", "jumbo", "12345");

	}

}