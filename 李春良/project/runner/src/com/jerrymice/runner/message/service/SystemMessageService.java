package com.jerrymice.runner.message.service;

import java.util.List;

import com.jerrymice.runner.entity.SystemNotice;

public interface SystemMessageService {
	public List<SystemNotice> findSysMsg(String queryString, Object[] values);
	public void saveSystemMessage(SystemNotice systemNotice);
}
