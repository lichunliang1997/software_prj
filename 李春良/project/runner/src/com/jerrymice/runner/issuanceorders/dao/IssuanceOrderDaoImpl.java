package com.jerrymice.runner.issuanceorders.dao;

import org.springframework.stereotype.Repository;

import com.jerrymice.runner.entity.Order;
import com.jerrymice.runner.util.impl.BaseDaoImpl;
@Repository(value="issuanceOrderDaoId")
public class IssuanceOrderDaoImpl extends BaseDaoImpl<Order> implements IssuanceOrderDao {

	
}
