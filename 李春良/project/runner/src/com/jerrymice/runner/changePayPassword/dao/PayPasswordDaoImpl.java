package com.jerrymice.runner.changePayPassword.dao;

import org.springframework.stereotype.Repository;

import com.jerrymice.runner.entity.Information;
import com.jerrymice.runner.util.impl.BaseDaoImpl;

@Repository(value="payPasswordId")
public class PayPasswordDaoImpl extends BaseDaoImpl<Information> implements PayPasswordDao {

}
