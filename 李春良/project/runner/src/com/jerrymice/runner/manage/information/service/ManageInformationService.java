package com.jerrymice.runner.manage.information.service;

import java.io.Serializable;

import com.jerrymice.runner.entity.Information;

public interface ManageInformationService {
	public Serializable saveInformation(Information information);
	public void updateInformation(Information information);
}
