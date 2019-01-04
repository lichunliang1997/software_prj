package com.jerrymice.runner.changePhone.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jerrymice.runner.changePhone.dao.PhoneDao;
import com.jerrymice.runner.entity.Information;

@Service(value="phoneServiceId")
public class PhoneServiceImpl implements PhoneService {
	@Resource(name="phoneDaoId")
	private PhoneDao pd;

	@Transactional(readOnly=false)
	@Override
	public void updatePhone(Information info) {
		pd.update(info);
	}
	
	
}
