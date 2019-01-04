package com.jerrymice.runner.pay.service;

import com.jerrymice.runner.entity.Order;

public interface OrderUpdateService {
	public void updateOrder(Order order) ;
	public Order findByOId(Object[] oid);
}
