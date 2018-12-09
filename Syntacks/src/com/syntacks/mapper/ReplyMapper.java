package com.syntacks.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.syntacks.entities.Reply;

public class ReplyMapper implements RowMapper<Reply> {
	
	@Override
	public Reply mapRow(ResultSet rs, int rowNum) throws SQLException {
		Reply reply = new Reply();
		 reply.setReply_id(rs.getInt("reply_id"));
		 reply.setTopic_id(rs.getInt("topic_id"));
		 reply.setUser(rs.getString("user"));
		 reply.setComments(rs.getString("comments"));
		 reply.setDate_reply(rs.getString("date_reply"));
		 return reply;
	}
}
