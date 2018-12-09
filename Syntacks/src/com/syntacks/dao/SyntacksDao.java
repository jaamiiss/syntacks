package com.syntacks.dao;

import java.util.List;

import javax.sql.DataSource;

import com.syntacks.entities.Login;
import com.syntacks.entities.Question;
import com.syntacks.entities.Reply;
import com.syntacks.entities.User;


public interface SyntacksDao {
	
	public void setDataSource(DataSource ds);
	public List<Question> listQuestions() ;
	public List<Question> listTags() ; 
	public void insert(String username, String password, String email);
	public void insertquestion(String title, String content, String tags,String date_time,String username) ;
	public Login login(String username, String password);
	public Question getQuestion(int title_id);
	public void insertreply(int reply_id, int topic_id, String user, String comments, String date_reply);
	public int deleteUser(int id);
}
