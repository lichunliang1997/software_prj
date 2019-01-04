package com.jerrymice.runner.issuanceorders.service;

import java.io.Serializable;

import com.jerrymice.runner.entity.Order;

public interface IssuanceOrderService {
	public Serializable saveOrder(Order order );
}
