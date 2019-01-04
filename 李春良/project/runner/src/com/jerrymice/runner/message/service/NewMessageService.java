package com.jerrymice.runner.message.service;

import java.util.List;

import com.jerrymice.runner.entity.ChatRecord;

public interface NewMessageService {
	public List<ChatRecord> findNewMsg(String queryString,Object[] values ) ;
}
