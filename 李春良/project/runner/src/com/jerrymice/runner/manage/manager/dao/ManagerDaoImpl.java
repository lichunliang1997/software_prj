package com.jerrymice.runner.manage.manager.dao;

import org.springframework.stereotype.Repository;

import com.jerrymice.runner.entity.Manager;
import com.jerrymice.runner.util.impl.BaseDaoImpl;
@Repository(value="managerDaoId")
public class ManagerDaoImpl extends BaseDaoImpl<Manager> implements ManagerDao {
	
}
