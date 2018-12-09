package com.syntacks.jdbc;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.syntacks.dao.SyntacksDao;
import com.syntacks.entities.Login;
import com.syntacks.entities.Question;
import com.syntacks.entities.Reply;
import com.syntacks.entities.User;
import com.syntacks.mapper.LoginMapper;
import com.syntacks.mapper.QuestionMapper;
import com.syntacks.mapper.ReplyMapper;
import com.syntacks.mapper.UserMapper;

public class SyntacksJdbc implements SyntacksDao{
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	

	public void insert(String username, String password, String email) {	
		int enabledValue =  1;
		String SQL = "INSERT INTO users (username, password, email) values (?, ?, ?)";
		jdbcTemplateObject.update(SQL, username, password, email);
		return;	
	}
	
	public void insertquestion(String title, String content, String tags, String date_time, String username) {
		String SQL = "INSERT INTO ask_questions (title, content, tags,date_time, username) values (?, ?, ?, ?, ?)";
		jdbcTemplateObject.update(SQL, title, content, tags, date_time, username);
		return;
	}
	
	public void updatequestion(String title_id, String title, String content, String tags) {
		String SQL = "UPDATE ask_questions SET title=?, content=?, tags=? WHERE title_id = '"+title_id+"'";
		System.out.println(SQL);
		jdbcTemplateObject.update(SQL, title, content, tags);
		
		return;
	}
	
	public Login login(String username, String password) {
		      String SQL = "SELECT * FROM users WHERE username LIKE ? AND password LIKE ?";
		      Login login= jdbcTemplateObject.queryForObject(SQL, new Object[]{username, password}, new LoginMapper());
		      return login;
	}
	
	public List<Question> listQuestions() {
		String SQL = "SELECT * FROM ask_questions ORDER BY date_time DESC";
		List<Question> questions = jdbcTemplateObject.query(SQL, new QuestionMapper());
		return questions;
	}
	
	public List<Question> listTags() {
		String SQL = "SELECT * FROM ask_questions ORDER by date_time DESC";
		List<Question> tags = jdbcTemplateObject.query(SQL, new QuestionMapper());
		return tags;
	}

	public List<Question> search(String search_data) {
		String SQL = "SELECT * FROM ask_questions WHERE title LIKE '%"+search_data+"%' OR content LIKE '%"+search_data+"%' OR tags LIKE '%"+search_data+"%'ORDER BY title DESC";
		System.out.println(SQL);
		List<Question> questions = jdbcTemplateObject.query(SQL, new QuestionMapper());
		return questions;
	}
	
	public List<Question> tags(String search_data) {
		String SQL = "SELECT DISTINCT * FROM ask_questions WHERE tags LIKE '%"+search_data+"%' ORDER BY date_time DESC";
		System.out.println(SQL);
		List<Question> stags = jdbcTemplateObject.query(SQL, new QuestionMapper());
		return stags;
	}
	
	public List<Question> countQuestions(){
		String SQL = "SELECT COUNT(*) FROM ask_questions";
		List<Question> count = jdbcTemplateObject.query(SQL, new QuestionMapper());
		return count;
	}
	
	public List<User> listUsers() {
		String SQL = "SELECT * FROM users ORDER BY username DESC";
		List<User> users = jdbcTemplateObject.query(SQL, new UserMapper());
		return users;
	}
	
	public List<User> searchUser(String search_data) {
		String SQL = "SELECT * FROM users WHERE username LIKE '%"+search_data+"%'";
		System.out.println(SQL);
		List<User> users = jdbcTemplateObject.query(SQL, new UserMapper());
		return users;
	}
	
	public List<Question> viewUserPost(String username) {
		String SQL = "SELECT * FROM ask_questions WHERE username = '"+username+"'";
		System.out.println(SQL);
		List<Question> questions = jdbcTemplateObject.query(SQL, new QuestionMapper());
		return questions;
	}
	
	@Override
	public Question getQuestion(int title_id) {
		String sql = "SELECT * FROM ask_questions WHERE title_id=" + title_id;
		return jdbcTemplateObject.query(sql, new ResultSetExtractor<Question>() {
			@Override
			public Question extractData(ResultSet rs) throws SQLException,
					DataAccessException {
				if (rs.next()) {
					Question question = new Question();
					question.setTitle_id(rs.getInt("title_id"));
					question.setContent(rs.getString("content"));
					question.setTitle(rs.getString("title"));
					question.setTags(rs.getString("tags"));
					question.setDate_time(rs.getString("date_time"));
					question.setUsername(rs.getString("username"));
					return question ;
				}
				
				return null;
			}
			
		});
	}
	
	public void insertreply(int reply_id, int topic_id, String user, String comments, String date_reply) {
		String SQL = "INSERT INTO reply_questions (reply_id, topic_id, user, comments, date_reply) values (?, ?, ?, ?, ?)";
		jdbcTemplateObject.update(SQL, reply_id, topic_id, user, comments, date_reply);
		return;
	}

	public List<Reply> listreply(int title_id){
		String SQL = "SELECT r.reply_id, r.topic_id, r.user, r.comments, r.date_reply FROM reply_questions r, ask_questions a WHERE r.topic_id = a.title_id AND r.topic_id ="+title_id;
		List<Reply> reply = jdbcTemplateObject.query(SQL, new ReplyMapper());
		return reply;
	}
	
	public User getUser(String username) {
		String sql = "SELECT * FROM users WHERE username LIKE ?";
		User user = jdbcTemplateObject.queryForObject(sql, new Object[]{username}, new UserMapper()) ;
		return user;
	}
	
	public void updateStatus(String enabled, String id){
		String SQL = "UPDATE users SET enabled=? WHERE id = '"+id+"'";
		System.out.println(SQL);
		jdbcTemplateObject.update(SQL, enabled, id);
		return;
	}
	
	public int deleteUser(int id){
		String SQL = "DELETE FROM users WHERE id = ?";
		System.out.print(SQL);
		int user = jdbcTemplateObject.update(SQL, id);
		return user;
	}

}
