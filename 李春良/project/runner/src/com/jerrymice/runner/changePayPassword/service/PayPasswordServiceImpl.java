package com.jerrymice.runner.changePayPassword.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jerrymice.runner.changePayPassword.dao.PayPasswordDao;
import com.jerrymice.runner.entity.Information;

@Service(value="payPasswordServiceId")
public class PayPasswordServiceImpl implements PayPasswordService {

	@Resource(name="payPasswordId")
	private PayPasswordDao payPasswordDao;
	
	@Transactional(readOnly=false)
	@Override
	public void updateInformation(Information info) {
		payPasswordDao.update(info);
	}

}
