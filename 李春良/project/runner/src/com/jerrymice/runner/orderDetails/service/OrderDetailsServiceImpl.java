package com.jerrymice.runner.orderDetails.service;

import java.sql.Timestamp;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jerrymice.runner.entity.Order;
import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.orderDetails.dao.OrderDetailsDao;

@Service(value="orderDetailsServiceId")
@Transactional(readOnly=false)
public class OrderDetailsServiceImpl implements OrderDetailsService {
	@Resource(name="orderDetailsDaoId")
	private OrderDetailsDao orderDetailsDao;
	
	

	
	/*
	 * 更新订单状态
	 * */



	public void updateStatus(int oid,User user) {
		Order order = new Order();
		order = this.orderDetailsDao.get(oid);
		order.setReceiptId(user);
		Timestamp d = new Timestamp(System.currentTimeMillis()); 
		order.setReceiptTime(d);
		order.setStatus(1);
		this.orderDetailsDao.update(order);
	}




	@Override
	public User findIssuanceUserByOrderId(int id) {
		// TODO Auto-generated method stub
		return orderDetailsDao.get(id).getInvoiceId();
	}

	
}
