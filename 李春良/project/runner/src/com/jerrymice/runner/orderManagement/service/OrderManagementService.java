package com.jerrymice.runner.orderManagement.service;

import java.util.List;

import com.jerrymice.runner.entity.Order;
import com.jerrymice.runner.entity.User;

public interface OrderManagementService {
	public User getuser(int uid);//查询用户
	public List<Order>findAll(Object[] userid);//查询所有发单者订单
	public List<Order>findAllByReceper(Object[] userid);//查询所有接单者订单
	public List<Order>findByStatus(Object[] userid);//单个状态
	public List<Order>findByStatus2(Object[] userid);//其他
	public List<Order>findByStatus3(Object[] userid);//已完成
	public List<Order>findByStatus4(Object[] userid);//运送中
	public Order findByOId(Object[] oid);
	public void updateStatus(int oid);//更新状态1-2
	public void updateStatus2(int oid);//更新状态2-3
	public void updateStatus3(int oid);//更新状态0-4
	public void updateStatus4(int oid);//更新状态3-6
	public void saveComment(String comment,User uId,User commentatorId,int score);
}
