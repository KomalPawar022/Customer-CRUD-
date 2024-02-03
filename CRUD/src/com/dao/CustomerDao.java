package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.bean.CustomerBean;

import com.connection.DBConnection;

public class CustomerDao {
	Boolean resultStatus=Boolean.FALSE;
	PreparedStatement ps;
	ResultSet rs;
    Statement st=null;
    String sql;
    boolean flag = false;
  
//Insert Customer		
		 public boolean InsertCustomerData(CustomerBean bean) {
			 sql = "INSERT INTO Customer" + "  (uuid, first_name, last_name, street, address, city, state, email, phone ) VALUES " +
					    " (?, ?, ?, ?, ?, ?, ?, ?, ?);";
				Connection con = DBConnection.getConnection();

				try {
					ps = con.prepareStatement(sql);

					ps.setString(1, bean.getuuid());
					ps.setString(2, bean.getFirstName());
					ps.setString(3, bean.getLastName());
					ps.setString(4, bean.getStreet());
					
					ps.setString(5, bean.getAddress());
					ps.setString(6, bean.getCity());
					ps.setString(7, bean.getState());
					ps.setString(8, bean.getEmail());
					ps.setString(9, bean.getPhone());
					
					

					int index = ps.executeUpdate();

					if (index > 0) {
						flag = true;
					} else {
						flag = false;
					}
				} catch (SQLException e) {

					e.printStackTrace();
				}
				return flag;
			}
		 
//Delete Customer
		 public boolean DeleteCustomerData(String id) {
			 sql = "DELETE FROM Customer WHERE uuid = ?";
				Connection con = DBConnection.getConnection();

				try {
					ps = con.prepareStatement(sql);
					ps.setString(1, id);
					int index = ps.executeUpdate();

					if (index > 0) {
						flag = true;
					} else {
						flag = false;
					}
				} catch (SQLException e) {

					e.printStackTrace();
				}
				
				return flag;
				
			}
//Update Customer
		 public boolean UpdateCustomerData(CustomerBean bean) {
			 sql = "Update Customer set first_name=?, last_name=?, street=?, address=?, city=?, state=?, email=?, phone=? Where uuid=?";
			 Connection con = DBConnection.getConnection();

				try {
					ps = con.prepareStatement(sql);

					
					ps.setString(1, bean.getFirstName());
					ps.setString(2, bean.getLastName());
					ps.setString(3, bean.getStreet());
					
					ps.setString(4, bean.getAddress());
					ps.setString(5, bean.getCity());
					ps.setString(6, bean.getState());
					ps.setString(7, bean.getEmail());
					ps.setString(8, bean.getPhone());
					ps.setString(9, bean.getuuid());
					

					int index = ps.executeUpdate();

					if (index > 0) {
						flag = true;
					} else {
						flag = false;
					}
				} catch (SQLException e) {

					e.printStackTrace();
				}
				return flag;
			}
		 
	
}
