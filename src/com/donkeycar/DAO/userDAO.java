package com.donkeycar.DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.donkeycar.bean.User;


public class userDAO {
	private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String DB_URL = "jdbc:mysql://localhost:3306/donkeycar?serverTimezone=UTC"
			+ "&useUnicode=true&characterEncoding=UTF-8&allowMultiQueries=true";
	private static final String USER = "root";
	private static final String PASSWORD = "j98619861";
	private static final String INSERT_USERS_SQL = "INSERT INTO user" +
            "  (username, useraccount, password, address, contact) VALUES " +
            " (?,?,?,?,?);";
	private static final String LOGIN_USERS_SQL = "SELECT * FROM user WHERE useraccount = ? and password = ?;";
	//private static final String SELECT_ALLINFO = "SELECT * FROM user WHERE useraccount=? ;";
	protected Connection getConnection() {

		Connection conn = null;
		try {
			Class.forName(JDBC_DRIVER); // µù¥UJDBC Driver¦bDriver Management¤º
			conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
//			Context context = new InitialContext();
//			DataSource ds = (DataSource) context.lookup("java:/comp/env/jdbc/servdb");
//			conn = ds.getConnection();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}
// µù¥U
	public int registerUser(User user) throws ClassNotFoundException {

        int result = 0;

        try (Connection conn = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement pstmt = conn.prepareStatement(INSERT_USERS_SQL);) {
        	//pstmt.setInt(1, 1);
        	System.out.println(user.getAddress());
        	pstmt.setString(1, user.getUsername());
        	pstmt.setString(2, user.getUseraccount());
        	pstmt.setString(3, user.getPassword());
        	pstmt.setString(4, user.getAddress());
        	pstmt.setString(5, user.getContact());

            System.out.println(pstmt);
            // Step 3: Execute the query or update query
            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return result;
    }
// µn¤J
	public User validate(User user) throws ClassNotFoundException {
		//boolean status = false;
		User userN = null;
		try {
			
			Connection conn = getConnection();
			
			if(conn==null) return null;
			// Step 2:Create a statement using connection object
			PreparedStatement pstmt = conn.prepareStatement(LOGIN_USERS_SQL);
			
			pstmt.setString(1, user.getUseraccount());
			pstmt.setString(2, user.getPassword());
			
			System.out.println(pstmt);
            ResultSet rs = pstmt.executeQuery();
            //status = rs.next();
            while (rs.next()) {
				String name = rs.getString("username");
				String useraccount = rs.getString("useraccount");
				String password = rs.getString("password");
				userN = new User(name, useraccount, password);
			}
			
		}catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
		return userN;
	}
	
    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
