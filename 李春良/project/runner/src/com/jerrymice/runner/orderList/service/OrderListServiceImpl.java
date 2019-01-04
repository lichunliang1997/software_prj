package com.jerrymice.runner.orderList.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jerrymice.runner.entity.Order;
import com.jerrymice.runner.orderList.dao.OrderListDao;
@Service(value="orderListServiceId")
public class OrderListServiceImpl implements OrderListService {
	@Resource(name="orderListDaoId")
	private OrderListDao orderListDao;
	
	/*查找所有订单*/
	@Transactional(readOnly=false)
	public List<Order> findAll() {
		List<Order> list = new ArrayList<Order>();
		list = orderListDao.find();
		return list;
	}
	
	
}
