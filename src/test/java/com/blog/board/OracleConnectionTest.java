package com.blog.board;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.blog.board.dao.MemberDAO;
import com.blog.board.domain.MemberVO;

public class OracleConnectionTest {

	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	private static final String USER = "lolong";
	private static final String PASSWORD = "lolong"; 
			
	@Autowired
	MemberDAO memberDAO;
	
	MemberVO memberVO;
	
	@Test
	public void testConnection() throws Exception {
		Class.forName(DRIVER);
		try {
			Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
			System.out.println(connection);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test    
    public void selectLoginView() throws Exception {
		System.out.println("1 : " + memberVO);
		String a = "kyle";
	try {
		System.out.println("try");
		memberDAO.selectLoginView_TEST();
	} catch (Exception e) {
		e.printStackTrace();
		// TODO: handle exception
	}
		
    }

}
