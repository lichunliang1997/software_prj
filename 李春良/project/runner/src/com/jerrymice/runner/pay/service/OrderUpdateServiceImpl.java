package com.jerrymice.runner.pay.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jerrymice.runner.entity.Order;
import com.jerrymice.runner.pay.dao.OrderUpdateDao;
@Service(value="orderUpdateServiceId")
@Transactional(readOnly=false)
public class OrderUpdateServiceImpl implements OrderUpdateService {
	@Resource(name="orderUpdateDaoId")
	private OrderUpdateDao orderUpdateDao;
	@Override
	public void updateOrder(Order order) {
		// TODO Auto-generated method stub
		orderUpdateDao.update(order);

	}
	@Override
	public Order findByOId(Object[] oid){
		// TODO Auto-generated method stub
		return this.orderUpdateDao.get("from Order o where o.orderNumber =? ",oid);

	}
}
