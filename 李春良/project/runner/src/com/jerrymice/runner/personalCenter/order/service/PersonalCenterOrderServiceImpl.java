package com.jerrymice.runner.personalCenter.order.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jerrymice.runner.entity.Order;
import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.personalCenter.order.dao.PersonalCenterOrderDao;

@Service(value="PersonalCenterOrderServiceImpl")
public class PersonalCenterOrderServiceImpl implements PersonalCenterOrderService {
	@Resource(name="PersonalCenterOrderDaoImpl")
	private PersonalCenterOrderDao PersonalCenterOrderDao;
	
	@Override
	public int orderCounts(User user) {
		// TODO Auto-generated method stub
		int count,count1;
		String hql = "from Order o where o.invoiceId=?";
		List<Order> list = PersonalCenterOrderDao.find(hql, new Object[] {user});
		if(list==null) {
			count = 0;
		}else {
			count = list.size();
		}
		String hql1 = "from Order o where o.receiptId=?";
		List<Order> list1 = PersonalCenterOrderDao.find(hql1, new Object[] {user});
		if(list1==null) {
			count1 = 0;
		}else {
			count1 = list1.size();
		}
		return count+count1;
	}

	@Override
	public int orderFinished(User user) {
		// TODO Auto-generated method stub
		int count,count1;
		String hql = "from Order o where o.status=? and o.invoiceId=?";
		List<Order> list = PersonalCenterOrderDao.find(hql, new Object[] {1,user});
		if(list==null) {
			count = 0;
		}else {
			count = list.size();
		}
		String hql1 = "from Order o where o.status=? and o.receiptId=?";
		List<Order> list1 = PersonalCenterOrderDao.find(hql1, new Object[] {1,user});
		if(list1==null) {
			count1 = 0;
		}else {
			count1 = list1.size();
		}
		return count+count1;
	}

	@Override
	public int orderUnfinished(User user) {
		// TODO Auto-generated method stub
		int count,count1;
		String hql = "from Order o where o.status=? and o.invoiceId=?";
		List<Order> list = PersonalCenterOrderDao.find(hql, new Object[] {0,user});
		if(list==null) {
			count = 0;
		}else {
			count = list.size();
		}
		String hql1 = "from Order o where o.status=? and o.receiptId=?";
		List<Order> list1 = PersonalCenterOrderDao.find(hql1, new Object[] {0,user});
		if(list1==null) {
			count1 = 0;
		}else {
			count1 = list1.size();
		}
		return count+count1;
	}



}
