package com.jerrymice.runner.register.service;

import java.io.Serializable;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.register.dao.RegisterDao;

@Service(value="registerServiceId")
public class RegisterServiceImpl implements RegisterService {
	@Resource(name="registerDaoId")
	private RegisterDao registerDao;

	@Override
	@Transactional(readOnly=false)
	public Serializable saveUser(User user) {
		return registerDao.save(user);
	}

	@Override
	public boolean isExist(String email) {
		String sql = "from User where email=?";
		String [] value = {email};
		User user =  registerDao.get(sql,value);
		if(user==null) {
			return false;
		}
		return true;
	}
}
