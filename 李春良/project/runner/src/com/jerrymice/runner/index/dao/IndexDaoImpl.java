package com.jerrymice.runner.index.dao;

import org.springframework.stereotype.Repository;

import com.jerrymice.runner.entity.Order;
import com.jerrymice.runner.util.impl.BaseDaoImpl;

@Repository(value="indexDaoId")
public class IndexDaoImpl extends BaseDaoImpl<Order> implements IndexDao{

}
