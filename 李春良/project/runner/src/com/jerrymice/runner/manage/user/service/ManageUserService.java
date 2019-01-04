package com.jerrymice.runner.manage.user.service;

import java.io.Serializable;
import java.util.List;

import com.jerrymice.runner.entity.User;

public interface ManageUserService {
	public Serializable saveUser(User save);
	public List<User> pageSearch(int page,int size);
	public User getUser(Integer id);
	public User getUser(String queryString, List<Object> values);
	public void updateUser(User user);
	public void deleteUser(User user);
	public User getUser(String queryString, Object[] values);
}
