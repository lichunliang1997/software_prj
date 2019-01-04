package com.jerrymice.runner.ordercenter.service;

import java.util.List;

import com.jerrymice.runner.entity.Order;

public interface OrderCenterOrderService {
	public List<Order>getOrdersByStationName(String stationName);
	public void updateOrder(Order order);
	public Order getOrderById(Integer id);
}
