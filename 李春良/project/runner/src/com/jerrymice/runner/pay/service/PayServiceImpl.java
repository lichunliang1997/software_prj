package com.jerrymice.runner.pay.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jerrymice.runner.entity.Information;
import com.jerrymice.runner.pay.dao.PayDao;
@Service(value="payServiceId" )
@Transactional(readOnly=false)
public class PayServiceImpl implements PayService {
	@Resource(name="payDaoId")
	private PayDao payDao;
	@Override
	public void  updateBa(Information information) {
		// TODO Auto-generated method stub
			payDao.update(information);
			return;
	}

}
