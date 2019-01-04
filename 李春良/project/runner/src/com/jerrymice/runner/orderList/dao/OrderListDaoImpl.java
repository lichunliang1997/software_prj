package com.jerrymice.runner.orderList.dao;

import org.springframework.stereotype.Repository;

import com.jerrymice.runner.entity.Order;
import com.jerrymice.runner.util.impl.BaseDaoImpl;
@Repository(value="orderListDaoId")
public class OrderListDaoImpl extends BaseDaoImpl<Order> implements OrderListDao {
	
}
