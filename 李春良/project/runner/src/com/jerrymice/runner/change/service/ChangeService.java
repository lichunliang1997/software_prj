package com.jerrymice.runner.change.service;

public interface ChangeService {
	public void updateUser(String oldEmail,String newEmail);
	
	public boolean isExist(String email);
}
