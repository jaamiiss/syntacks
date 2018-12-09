package com.syntacks.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.syntacks.entities.Question;



public class QuestionMapper implements RowMapper<Question> {
	 public Question mapRow(ResultSet rs, int rowNum) throws SQLException {
	      Question question = new Question();
	      question.setTitle(rs.getString("title"));
	      question.setContent(rs.getString("content"));
	      question.setTags(rs.getString("tags"));
	      question.setDate_time(rs.getString("date_time"));
	      question.setTitle_id((rs.getInt("title_id")));
	      question.setUsername((rs.getString("username")));   
	      
	      return question;
	   }
}


