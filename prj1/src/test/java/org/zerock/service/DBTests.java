package org.zerock.service;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class DBTests {
	
	@Test
	public void testConnection() throws Exception {
		
		String driver = "com.mysql.cj.jdbc.Driver";  
		String url = "jdbc:mysql://zerockinstance.cmal2b0ps3lb.ap-northeast-2.rds.amazonaws.com:3306/zerock?useSSL=false&serverTimezone=Asia/Seoul";
		
		Class.forName(driver);
		//
		Connection con =
				DriverManager.getConnection(url,"zerock","12345678");
		
		System.out.println(con);
		
		con.close();

	}

}
