package com.jerrymice.runner.ordercenter.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jerrymice.runner.entity.Order;
import com.jerrymice.runner.ordercenter.dao.OrderCenterOrderDao;
@Service(value="orderCenterOrderServiceId")
public class OrderCenterOrderServiceImpl implements OrderCenterOrderService {
	@Resource(name="orderCenterOrderDaoId")
	private OrderCenterOrderDao orderCenterOrderDao;
	@Override
	@Transactional(readOnly=false)
	public List<Order> getOrdersByStationName(String stationName) {
		// TODO Auto-generated method stub
		String queryString="from Order where delivery=? and status=?";
		Object[]values= {stationName,0};
		return orderCenterOrderDao.find(queryString, values);
	}
	@Override
	@Transactional(readOnly=false)
	public void updateOrder(Order order) {
		// TODO Auto-generated method stub
		orderCenterOrderDao.update(order);
	}
	@Override
	@Transactional(readOnly=false)
	public Order getOrderById(Integer id) {
		return orderCenterOrderDao.get(id);
	}
}
