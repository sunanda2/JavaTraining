package com.java.mphasis.CanteenProject;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.java.mphasis.InvetoryProject.ConnectionHelper;

public class CustomerDAO {

	Connection con;
	PreparedStatement pst;
	
	public int generateCustomerId() throws SQLException
	{
		con=ConnectionHelper.getConnection();
		String cmd="select case when max(cus_id) is NUll then 1"
				   + "else max(cus_id)+1 end cid from customer";
		pst=con.prepareStatement(cmd);
		ResultSet rs=pst.executeQuery();
		rs.next();
		int cId=rs.getInt("cid");
		return cId;
	}
	
	public String addCustomer(Customer customer) throws SQLException
	{
		con=ConnectionHelper.getConnection();
		String cmd="insert into customer(cus_id,cus_name,cus_password,cus_email,cus_mobile,cus_dob,cus_address)"
					+ "values(?,?,?,?,?,?,?)";
		pst=con.prepareStatement(cmd);
		pst.setInt(1, customer.getCus_id());
		pst.setString(2, customer.getCus_name());
		pst.setString(3, customer.getCus_password());
		pst.setString(4, customer.getCus_email());
		pst.setString(5, customer.getCus_mobile());
		pst.setDate(6, (Date) customer.getCus_dob());
		pst.setString(7, customer.getCus_address());
		pst.executeUpdate();
		return "*** CUSTOMER ADDED SUCCESSFULLY ***";
	}
	
	public Customer searchCustomer(int cus_id) throws SQLException
	{
		Customer customer=null;
		con=ConnectionHelper.getConnection();
		String cmd="select * from customer where cus_id=?";
		pst=con.prepareStatement(cmd);
		pst.setInt(1, cus_id);
		ResultSet rs=pst.executeQuery();
		if(rs.next())
		{
			customer=new Customer();
			customer.setCus_id(rs.getInt("cus_id"));
			customer.setCus_name(rs.getString("cus_name"));
			customer.setCus_password(rs.getString("cus_password"));
			customer.setCus_email(rs.getString("cus_email"));
			customer.setCus_mobile(rs.getString("cus_mobile"));
			customer.setCus_dob(rs.getDate("cus_dob"));
			customer.setCus_address(rs.getString("cus_address"));
		}
		return customer;
	}
	
	public int authenCustomer(String cus_email,String cus_password) throws SQLException
	{
		con=ConnectionHelper.getConnection();
		String cmd="select count(*) cnt from customer where cus_email=? and cus_password=?";
		pst=con.prepareStatement(cmd);
		pst.setString(1, cus_email);
		pst.setString(2, cus_password);
		ResultSet rs=pst.executeQuery();
		rs.next();
		int cnt= rs.getInt("cnt");
		return cnt;
	}
}
