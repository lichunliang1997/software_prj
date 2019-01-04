package com.jerrymice.runner.orderManagement.service;


import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jerrymice.runner.entity.CommentaryRecord;
import com.jerrymice.runner.entity.Order;
import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.orderManagement.Dao.OrderManagementDao;
import com.jerrymice.runner.orderManagement.Dao.OrderManagementDao2;
import com.jerrymice.runner.orderManagement.Dao.OrderManagementDao3;


@Service(value="orderManagementServiceId")
@Transactional(readOnly=false)
public class OrderManagementServiceImpl implements OrderManagementService {
	@Resource(name="orderManagementDaoId")
	private OrderManagementDao orderManagementDao;
	@Resource(name="orderManagementDaoId2")
	private OrderManagementDao2 orderManagementDao2;
	@Resource(name="orderManagementDaoId3")
	private OrderManagementDao3 orderManagementDao3;
	@Override
	public List<Order> findAll(Object[] userid) {
		// TODO Auto-generated method stub
		return this.orderManagementDao.find("from Order o where o.invoiceId = ? or o.receiptId = ? order by invoiceTime desc",userid);
	}

	@Override
	public List<Order> findAllByReceper(Object[] userid) {
		// TODO Auto-generated method stub
		return this.orderManagementDao.find("from Order o where o.receiptId = ?",userid);
	}
	
	@Override
	public User getuser(int uid) {
		// TODO Auto-generated method stub
		return 	this.orderManagementDao2.get(uid);
	}

	@Override
	public List<Order> findByStatus(Object[] userid) {
		// TODO Auto-generated method stub
		return this.orderManagementDao.find("from Order o where o.invoiceId = ? and o.status = ?",userid);
	}

	@Override
	public List<Order> findByStatus2(Object[] userid) {
		// TODO Auto-generated method stub
		return this.orderManagementDao.find("from Order o where (o.invoiceId = ? and o.status in (4,5)) or o.receiptId = ? and o.status in (4,5) order by invoiceTime desc",userid);
	}

	@Override
	public List<Order> findByStatus3(Object[] userid) {
		// TODO Auto-generated method stub
		return this.orderManagementDao.find("from Order o where (o.invoiceId = ? and o.status in (3,6)) or o.receiptId = ? and o.status in (3,6) order by invoiceTime desc",userid);
	}

	@Override
	public List<Order> findByStatus4(Object[] userid) {
		// TODO Auto-generated method stub
		return this.orderManagementDao.find("from Order o where (o.invoiceId = ? and o.status in (1,2)) or o.receiptId = ? and o.status in (1,2) order by invoiceTime desc",userid);
	}
	
	@Override
	public Order findByOId(Object[] oid){
		// TODO Auto-generated method stub
		return this.orderManagementDao.get("from Order o where o.orderNumber =? ",oid);

	}

	@Override
	public void updateStatus(int oid) {
		// TODO Auto-generated method stub
		Order o = new Order();
		o = this.orderManagementDao.get(oid);
		o.setStatus(2);
		this.orderManagementDao.update(o);
	}

	@Override
	public void updateStatus2(int oid) {
		// TODO Auto-generated method stub
		Order o = new Order();
		o = this.orderManagementDao.get(oid);
		int money=o.getReceiptId().getInformation().getaBalance();
		o.getReceiptId().getInformation().setaBalance(o.getMoney()+money);
		o.setStatus(3);
		Timestamp d = new Timestamp(System.currentTimeMillis()); 
		o.setSuccessTime(d);
		this.orderManagementDao.update(o);
	}

	@Override
	public void updateStatus3(int oid) {
		// TODO Auto-generated method stub
		Order o = new Order();
		o = this.orderManagementDao.get(oid);
		o.setStatus(4);
		this.orderManagementDao.update(o);
	}

	@Override
	public void updateStatus4(int oid) {
		// TODO Auto-generated method stub
		Order o = new Order();
		o = this.orderManagementDao.get(oid);
		o.setStatus(6);
		this.orderManagementDao.update(o);
	}

	@Override
	public void saveComment(String comment,User uId,User commentatorId,int score) {
		// TODO Auto-generated method stub
		CommentaryRecord cr = new CommentaryRecord();
		cr.setComment(comment);
		cr.setuId(uId);
		cr.setCommentatorId(commentatorId);
		cr.setScore(score);
		Timestamp d = new Timestamp(System.currentTimeMillis()); 
		cr.setTimes(d);
		this.orderManagementDao3.save(cr);
	}

	




}
