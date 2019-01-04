package com.jerrymice.runner.message.dao;


import org.springframework.stereotype.Repository;

import com.jerrymice.runner.entity.ChatRecord;
import com.jerrymice.runner.util.impl.BaseDaoImpl;
@Repository(value="chatRecordDaoId")
public class ChatRecordDaoImpl extends BaseDaoImpl<ChatRecord> implements ChatRecordDao {

}
