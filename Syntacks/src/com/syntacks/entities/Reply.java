package com.syntacks.entities;

public class Reply {
	private int reply_id;
	private int topic_id;
	private String user;
	private String comments;
	private String date_reply;
	
	public int getReply_id() {
		return reply_id;
	}
	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}
	public int getTopic_id() {
		return topic_id;
	}
	public void setTopic_id(int topic_id) {
		this.topic_id = topic_id;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getDate_reply() {
		return date_reply;
	}
	public void setDate_reply(String date_reply) {
		this.date_reply = date_reply;
	}
}
