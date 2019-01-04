package com.jerrymice.runner.manage.information.dao;

import org.springframework.stereotype.Repository;

import com.jerrymice.runner.entity.Information;
import com.jerrymice.runner.util.impl.BaseDaoImpl;
@Repository(value="manageInformationDaoId")
public class ManageInformationDaoImpl extends BaseDaoImpl<Information> implements ManageInformationDao {

}
