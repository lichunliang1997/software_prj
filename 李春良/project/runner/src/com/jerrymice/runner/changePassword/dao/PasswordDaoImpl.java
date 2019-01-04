package com.jerrymice.runner.changePassword.dao;

import org.springframework.stereotype.Repository;

import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.util.impl.BaseDaoImpl;

@Repository(value="passwordDaoId")
public class PasswordDaoImpl extends BaseDaoImpl<User> implements PasswordDao{

}
