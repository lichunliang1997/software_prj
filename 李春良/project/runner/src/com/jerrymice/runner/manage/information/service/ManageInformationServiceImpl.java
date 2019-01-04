package com.jerrymice.runner.manage.information.service;

import java.io.Serializable;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jerrymice.runner.entity.Information;
import com.jerrymice.runner.manage.information.dao.ManageInformationDao;

@Service(value="manageInformationServiceId")
public class ManageInformationServiceImpl implements ManageInformationService{
	@Resource(name="manageInformationDaoId")
	private ManageInformationDao manageInformationDao;
	@Override
	@Transactional(readOnly=false)
	public Serializable saveInformation(Information information) {
		// TODO Auto-generated method stub
		return manageInformationDao.save(information);
	}
	@Override
	@Transactional(readOnly=false)
	public void updateInformation(Information information) {
		// TODO Auto-generated method stub
		manageInformationDao.update(information);
	}

}
