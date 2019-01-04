package com.jerrymice.runner.orderDetails.service;

import com.jerrymice.runner.entity.User;

public interface OrderDetailsService {
	
	void updateStatus(int oid,User user);
	User findIssuanceUserByOrderId(int id);
}
