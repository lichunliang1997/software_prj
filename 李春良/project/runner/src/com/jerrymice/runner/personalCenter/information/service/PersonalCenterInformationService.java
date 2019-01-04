package com.jerrymice.runner.personalCenter.information.service;

import java.io.Serializable;
import java.util.List;

import com.jerrymice.runner.entity.Information;



public interface PersonalCenterInformationService {
	public List<Information> findAll();
	public Information findById(Integer id);
	public Serializable saveInformation(Information information);
	public void update(Information information);
}

	
