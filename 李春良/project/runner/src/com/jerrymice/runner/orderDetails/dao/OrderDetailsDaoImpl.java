package com.jerrymice.runner.orderDetails.dao;

import org.springframework.stereotype.Repository;

import com.jerrymice.runner.entity.Order;
import com.jerrymice.runner.util.impl.BaseDaoImpl;
@Repository(value="orderDetailsDaoId")
public class OrderDetailsDaoImpl extends BaseDaoImpl<Order> implements OrderDetailsDao {
	
}
