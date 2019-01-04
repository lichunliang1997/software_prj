package com.jerrymice.runner.manage.user.dao;

import org.springframework.stereotype.Repository;

import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.util.impl.BaseDaoImpl;
@Repository(value="manageUserDaoId")
public class ManageUserDaoImpl extends BaseDaoImpl<User> implements ManageUserDao {

}
