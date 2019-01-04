package com.jerrymice.runner.message.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jerrymice.runner.entity.ChatRecord;
import com.jerrymice.runner.message.dao.NewMessageDao;

@Service(value="newMessageServiceId")
public class NewMessageServiceImpl implements NewMessageService{
	@Resource(name="newMessageDaoId")
	private NewMessageDao newMessageDao;
	@Override
	public List<ChatRecord> findNewMsg(String queryString, Object[] values) {
		// TODO Auto-generated method stub
		return newMessageDao.find(queryString, values);
	}
}
