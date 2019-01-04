package com.jerrymice.runner.message.dao;

import org.springframework.stereotype.Repository;

import com.jerrymice.runner.entity.SystemNotice;
import com.jerrymice.runner.util.impl.BaseDaoImpl;
@Repository(value="systemMessageDaoId")
public class SystemMessageDaoImpl extends BaseDaoImpl<SystemNotice> implements SystemMessageDao{

}
