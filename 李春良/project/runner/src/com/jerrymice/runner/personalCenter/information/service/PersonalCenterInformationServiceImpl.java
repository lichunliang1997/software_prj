package com.jerrymice.runner.personalCenter.information.service;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jerrymice.runner.entity.Information;
import com.jerrymice.runner.personalCenter.information.dao.PersonalCenterInformationDao;
@Service(value="PersonalCenterInformationServiceImpl")
public class PersonalCenterInformationServiceImpl implements PersonalCenterInformationService {
	@Resource(name="PersonalCenterInformationDaoImpl")
	private PersonalCenterInformationDao PersonalCenterInformationDao;

	@Override
	@Transactional(readOnly=false)
	public List<Information> findAll() {
		// TODO Auto-generated method stub
		List<Information> list = PersonalCenterInformationDao.find();
		return list;
	}

	@Override
	@Transactional(readOnly=false)
	public Information findById(Integer id) {
		// TODO Auto-generated method stub
		Information information = PersonalCenterInformationDao.get(id);
		return information;
	}

	@Override
	@Transactional(readOnly=false)
	public Serializable saveInformation(Information information) {
		// TODO Auto-generated method stub
		return PersonalCenterInformationDao.save(information);
	}

	@Override
	@Transactional(readOnly=false)
	public void update(Information information) {
		// TODO Auto-generated method stub
		this.PersonalCenterInformationDao.update(information);
	}

}
