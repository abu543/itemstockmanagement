package com.saquib.data;


import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.saquib.model.User;

public  class UserDAOImpl implements UserDAO {

	@Override
	public void addUser(User user) throws Exception {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement ps=null;
		try {
			con= ConnectionFactory.getCon();
			ps=con.prepareStatement("insert users values(?,?,?,?,?,?,?)");
			ps.setString(1, user.getUserId());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getFirstName());
			ps.setString(4, user.getLastName());
			ps.setString(5, user.getAddress());
			ps.setString(6, user.getCity());
			ps.setBlob(7, user.getInputStream());     // jab registration karenge toh photo add krne ko mangega
			ps.executeUpdate();
		}
		finally {
			con.close();
		}
	}

	@Override
	public User getUser(String userId) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		User user = null;
		try {
			con = ConnectionFactory.getCon();
			ps = con.prepareStatement("select * from users where users_id=?");
			ps.setString(1,userId);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setUserId(rs.getString(1));
				user.setPassword(rs.getString(2));
				user.setFirstName(rs.getString(3));
				user.setLastName(rs.getString(4));
				user.setAddress(rs.getString(5));
				user.setCity(rs.getString(6));
				
				Blob photo= rs.getBlob(7);							// get photo from user
				user.setPhoto(photo.getBytes(1,  (int)photo.length()));  //
				
			}
			else {
				throw new Exception("invalid user id");
				
			}
		}
		finally 
		{
			con.close();
		}
		return user;
	}

	@Override
	public void updatePhoto(String userId, InputStream inputStream) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = ConnectionFactory.getCon();
			ps = con.prepareStatement("update users set photo=? where users_id=?");
			ps.setBlob(1, inputStream);
			ps.setString(2, userId);
			
			ps.executeUpdate();
		}
		finally {
			con.close();
		}
		
		
	}

}
		