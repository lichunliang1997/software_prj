package com.jerrymice.runner.retrieve.dao;

import org.springframework.stereotype.Repository;

import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.util.impl.BaseDaoImpl;

@Repository(value="retrieveDaoId")
public class RetrieveDaoImpl extends BaseDaoImpl<User> implements RetrieveDao {
	
}
