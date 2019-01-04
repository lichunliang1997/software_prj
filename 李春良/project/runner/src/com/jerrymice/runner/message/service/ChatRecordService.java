package com.jerrymice.runner.message.service;

import java.util.List;

import com.jerrymice.runner.entity.ChatRecord;

public interface ChatRecordService {
	public void saveChatRecord(ChatRecord chatRecord);
	public List<ChatRecord> searchChatRecord(String sender,String reciever);
	public List<ChatRecord>searchChatRecordByUser(Integer id);
}
