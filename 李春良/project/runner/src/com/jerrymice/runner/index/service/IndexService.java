package com.jerrymice.runner.index.service;

import java.util.List;

import com.jerrymice.runner.entity.Order;

public interface IndexService {
	public  List<Order> findOrder(int count,String queryString,Object[] values) ;
}
