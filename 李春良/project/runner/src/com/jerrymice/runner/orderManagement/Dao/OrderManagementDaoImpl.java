package com.jerrymice.runner.orderManagement.Dao;


import org.springframework.stereotype.Repository;

import com.jerrymice.runner.entity.Order;

import com.jerrymice.runner.util.impl.BaseDaoImpl;
@Repository(value="orderManagementDaoId")
public class OrderManagementDaoImpl extends BaseDaoImpl<Order> implements OrderManagementDao {


}
