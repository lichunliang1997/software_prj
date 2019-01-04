package com.jerrymice.runner.login.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jerrymice.runner.changePayPassword.dao.PayPasswordDao;
import com.jerrymice.runner.entity.Information;
import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.login.dao.LoginDao;

@Service(value="loginServiceId")
public class LoginServiceImpl implements LoginService {

	@Resource(name="loginDaoId")
	private LoginDao loginDao;
	@Resource(name="payPasswordId")
	private PayPasswordDao ppd;

	@Override
	public boolean isExist(String email) {
		String sql = "from User where email=?";
		String [] value = {email};
		User user =  loginDao.get(sql,value);
		System.out.println(user);
			if(user == null) {
				return false;
			}
			return true;
		}

	@Override
	public boolean islogin(String username, String password) {
		System.out.println(username+":"+password);
		String queryString="from User where email=?";
		Object[]values= {username};
		User user=loginDao.get(queryString, values);
		System.out.println(user);
		if(user.getPassword().equals(password)) {
			return true;
		}
		return false;
	}

	@Override
	public User getUser(String username, String password) {
		String queryString="from User where email=?";
		Object[]values= {username};
		User user=loginDao.get(queryString, values);
		return user;
	}

	@Override
	public Information getInfo(User user) {
		Information info = ppd.get(user.getId());
		return info;
	}
	
	
	
}
