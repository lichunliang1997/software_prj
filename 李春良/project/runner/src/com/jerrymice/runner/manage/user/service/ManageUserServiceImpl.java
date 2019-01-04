package com.jerrymice.runner.manage.user.service;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.manage.user.dao.ManageUserDao;
@Service(value="manageUserServiceId")
public class ManageUserServiceImpl implements ManageUserService {
	@Resource(name="manageUserDaoId")
	private ManageUserDao manageUserDao;
	@Override
	@Transactional(readOnly=false)
	public Serializable saveUser(User user) {
		// TODO Auto-generated method stub
		return manageUserDao.save(user);
	}
	@Override
	@Transactional(readOnly=false)
	public List<User> pageSearch(int page, int size) {
		// TODO Auto-generated method stub
		String queryString="from User order by id asc";
		Object[]values= {};
		return manageUserDao.find(queryString, values, page, size);
	}
	@Override
	@Transactional(readOnly=false)
	public User getUser(Integer id) {
		// TODO Auto-generated method stub
		return manageUserDao.get(id);
	}
	@Override
	@Transactional(readOnly=false)
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		manageUserDao.update(user);
	}
	@Override
	@Transactional(readOnly=false)
	public void deleteUser(User user) {
		// TODO Auto-generated method stub
		manageUserDao.delete(user);
	}
	@Override
	@Transactional(readOnly=false)
	public User getUser(String queryString, List<Object> values) {
		// TODO Auto-generated method stub
		return manageUserDao.get(queryString, values);
	}
	@Override
	@Transactional(readOnly=false)
	public User getUser(String queryString, Object[] values) {
		// TODO Auto-generated method stub
		return manageUserDao.get(queryString, values);
	}
}
