package com.jerrymice.runner.pay.dao;

import org.springframework.stereotype.Repository;

import com.jerrymice.runner.entity.Order;
import com.jerrymice.runner.util.impl.BaseDaoImpl;
@Repository(value="orderUpdateDaoId")
public class OrderUpdateDaoImpl extends BaseDaoImpl<Order>implements OrderUpdateDao {

}
