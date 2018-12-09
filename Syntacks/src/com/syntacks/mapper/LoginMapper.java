package com.syntacks.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.syntacks.entities.Login;

public class LoginMapper implements RowMapper<Login> {
   public Login mapRow(ResultSet rs, int rowNum) throws SQLException {
      Login login = new Login();
      login.setUsername(rs.getString("username"));
      login.setPassword(rs.getString("password"));
      return login;
   }
}
