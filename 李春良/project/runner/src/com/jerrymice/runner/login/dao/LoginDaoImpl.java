package com.jerrymice.runner.login.dao;

import org.springframework.stereotype.Repository;

import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.util.impl.BaseDaoImpl;

@Repository(value="loginDaoId")
public class LoginDaoImpl extends BaseDaoImpl<User> implements LoginDao {

}
