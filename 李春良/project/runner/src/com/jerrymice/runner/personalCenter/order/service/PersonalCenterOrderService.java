package com.jerrymice.runner.personalCenter.order.service;

import com.jerrymice.runner.entity.User;

public interface PersonalCenterOrderService {
	//订单总数
	public int orderCounts(User user);
	//已完成订单数
	public int orderFinished(User user);
	//进行中订单数
	public int orderUnfinished(User user);
}
