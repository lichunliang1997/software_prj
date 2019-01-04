package com.jerrymice.runner.index.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jerrymice.runner.entity.Order;
import com.jerrymice.runner.index.dao.IndexDao;

@Service(value="indexServiceId")
public  class IndexServiceImpl implements IndexService{
	@Resource(name="indexDaoId")
	private IndexDao indexDao;
	@Override
	public List<Order> findOrder(int count,String queryString,Object[]values) {
		return this.indexDao.findPart(count, queryString, values);
	}
}
