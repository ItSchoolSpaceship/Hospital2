package org.zerock.persistence;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JdbcTests {
	
	@Test
	public void testConnection() throws Exception {
		
		Class clz = Class.forName("oracle.jdbc.driver.OracleDriver");
		
	  Connection con = 
	  		DriverManager.getConnection(
	  				"jdbc:oracle:thin:@localhost:1521:XE",
	  				"eyes", "tiger");
	  
	  log.info(con);
	  con.close();
	}
}
