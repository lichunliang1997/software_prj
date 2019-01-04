package com.jerrymice.runner.manage.manager.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jerrymice.runner.entity.Manager;
import com.jerrymice.runner.manage.manager.dao.ManagerDao;

@Service(value="managerServiceId")
public class ManagerServiceImpl implements ManagerService {
	@Resource(name="managerDaoId")
	private ManagerDao managerDao;
	@Override
	public boolean login(String username, String password) {
		System.out.println(username+":"+password);
		// TODO Auto-generated method stub
		String queryString="from Manager where  username=?";
		Object[]values= {username};
		Manager manager=managerDao.get(queryString, values);
		System.out.println(manager);
		if(manager.getPassword().equals(password)) {
			return true;
		}
		return false;
	}

}
