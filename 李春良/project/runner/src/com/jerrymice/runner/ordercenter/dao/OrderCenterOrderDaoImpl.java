package com.jerrymice.runner.ordercenter.dao;


import org.springframework.stereotype.Repository;

import com.jerrymice.runner.entity.Order;
import com.jerrymice.runner.util.impl.BaseDaoImpl;
@Repository(value="orderCenterOrderDaoId")
public class OrderCenterOrderDaoImpl extends BaseDaoImpl<Order> implements OrderCenterOrderDao {

}
