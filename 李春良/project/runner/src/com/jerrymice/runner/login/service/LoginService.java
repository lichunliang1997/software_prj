package com.jerrymice.runner.login.service;

import com.jerrymice.runner.entity.Information;
import com.jerrymice.runner.entity.User;

public interface LoginService {
	public boolean isExist(String email);
	public boolean islogin(String username, String password);
	public User getUser(String username,String password);
	public Information getInfo(User user);
}
