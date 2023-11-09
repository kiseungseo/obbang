package com.obbang.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.Test;

public class JDBCTest {
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	@Test
	public void testConnection() {
		Connection con;
		try {
			con = DriverManager.getConnection("jdbc:mysql://192.168.0.6:/obbang?serverTimezone=Asia/Seoul",
					"obbang","qazwsx12!!");
			System.out.println(con);
		} catch (SQLException e) {
			fail(e.getMessage());
		}
		
	}
	
}
