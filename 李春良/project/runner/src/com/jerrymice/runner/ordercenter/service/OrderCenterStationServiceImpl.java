package com.jerrymice.runner.ordercenter.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jerrymice.runner.entity.Station;
import com.jerrymice.runner.ordercenter.dao.OrderCenterStationDao;
@Service(value="orderCenterStationServiceId")
public class OrderCenterStationServiceImpl implements OrderCenterStationService {
	@Resource(name="orderCenterStationDaoId")
	private OrderCenterStationDao orderCenterStationDao;
	@Override
	@Transactional(readOnly=false)
	public List<Station> getStationsBySchoolName(String schoolName) {
		// TODO Auto-generated method stub
		Station station=orderCenterStationDao.get("from Station where name=?", new Object[] {schoolName});
		return orderCenterStationDao.find("from Station where parentId=?", new Object[] {station});
	}
	@Override
	@Transactional(readOnly=false)
	public Station getStationByLnglat(String lnglat) {
		// TODO Auto-generated method stub
		return orderCenterStationDao.get("from Station where lnglat=?", new Object[]{lnglat});
	}

}
