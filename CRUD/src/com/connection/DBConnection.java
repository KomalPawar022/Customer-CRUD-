package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	public static String DBName="Customers";
	public static String DBUSER="root";			// Change the user 
	public static String DBPASSWORD="password";	// Change the password to your mysql password
	public static Connection connection;
	public static Connection getConnection() {
		
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+DBName,DBUSER,DBPASSWORD);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return connection;
	}
}
