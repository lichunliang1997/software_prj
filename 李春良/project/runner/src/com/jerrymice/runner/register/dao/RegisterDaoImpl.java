package com.jerrymice.runner.register.dao;

import org.springframework.stereotype.Repository;

import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.util.impl.BaseDaoImpl;

@Repository(value="registerDaoId")
public class RegisterDaoImpl extends BaseDaoImpl<User> implements RegisterDao {

}
