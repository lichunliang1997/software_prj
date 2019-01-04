package com.jerrymice.runner.changePhone.dao;

import org.springframework.stereotype.Repository;

import com.jerrymice.runner.entity.Information;
import com.jerrymice.runner.util.impl.BaseDaoImpl;

@Repository(value="phoneDaoId")
public class PhoneDaoImpl extends BaseDaoImpl<Information> implements PhoneDao{
	
}
