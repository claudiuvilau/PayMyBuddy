package com.openclassrooms.paymybuddy;

import java.sql.Connection;
import java.sql.SQLException;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.openclassrooms.paymybuddy.config.DataBaseConfig;

@SpringBootApplication
public class PaymybuddyApplication {

	public static void main(String[] args) throws SQLException {
		SpringApplication.run(PaymybuddyApplication.class, args);

		connexion();

	}

	public static void connexion() throws SQLException {

		DataBaseConfig dataBaseConfig = new DataBaseConfig();
		Connection con = null;

		con = dataBaseConfig.getConnection();

	}

}