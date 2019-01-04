package com.jerrymice.runner.message.dao;

import java.sql.Timestamp;

import com.jerrymice.runner.entity.User;

public class UserAndLastTime {
	private User user;
	private Timestamp timestamp;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Timestamp getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}
	@Override
	public String toString() {
		return "UserAndLastTime [user=" + user + ", timestamp=" + timestamp + "]";
	}
	
}
