package com.jerrymice.runner.register.service;

import java.io.Serializable;

import com.jerrymice.runner.entity.User;

public interface RegisterService {
	public Serializable saveUser(User user);
	public boolean isExist(String email);
}
