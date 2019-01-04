package com.jerrymice.runner.change.dao;


import org.springframework.stereotype.Repository;

import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.util.impl.BaseDaoImpl;

@Repository(value="changeDaoId")
public class ChangeDaoImpl extends BaseDaoImpl<User> implements ChangeDao {
}
