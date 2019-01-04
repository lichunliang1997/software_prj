package com.jerrymice.runner.changePassword.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jerrymice.runner.changePassword.dao.PasswordDao;
import com.jerrymice.runner.entity.User;

@Service(value="passwrodService")
public class PasswordServiceImpl implements PasswordService {

	@Resource(name="passwordDaoId")
	private PasswordDao passwordDao;

	@Transactional(readOnly=false)
	@Override
	public void updateUser(User user) {
		passwordDao.update(user);
	}

}
