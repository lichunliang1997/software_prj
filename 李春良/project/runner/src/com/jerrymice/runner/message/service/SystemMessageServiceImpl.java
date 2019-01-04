package com.jerrymice.runner.message.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jerrymice.runner.entity.SystemNotice;
import com.jerrymice.runner.message.dao.SystemMessageDao;

@Service(value="systemMessageServiceId")
public class SystemMessageServiceImpl implements SystemMessageService{
	@Resource(name="systemMessageDaoId")
	private SystemMessageDao systemMessageDao;
	@Override
	@Transactional(readOnly=false)
	public List<SystemNotice>  findSysMsg(String queryString,Object[] values){
		return systemMessageDao.find(queryString, values);
	}
	@Override
	@Transactional(readOnly=false)
	public void saveSystemMessage(SystemNotice systemNotice) {
		// TODO Auto-generated method stub
		systemMessageDao.save(systemNotice);
	}
}
