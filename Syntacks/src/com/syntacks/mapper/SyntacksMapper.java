package com.syntacks.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.syntacks.entities.User;


public class SyntacksMapper implements RowMapper<User> {

	@Override
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		User user = new User();
		 user.setUsername(rs.getString("username"));
		 user.setPassword(rs.getString("password"));
		 user.setEmail(rs.getString("email"));
		 return user;
	}

}