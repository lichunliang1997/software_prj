package com.jerrymice.runner.issuanceorders.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jerrymice.runner.entity.Station;
import com.jerrymice.runner.issuanceorders.dao.IssuanceStationDao;
@Service(value="issuanceStationServiceId")
public class IssuanceStationServiceImpl implements IssuanceStationService {
	@Resource(name="issuanceStationDaoId")
	private IssuanceStationDao issuanceStationDao;
	
	@Override
	@Transactional(readOnly=false)
	public List<Station> getStations(String schoolName) {
		// TODO Auto-generated method stub
		Station station=issuanceStationDao.get("from Station where name=?", new Object[] {schoolName});
		System.out.println(station);
		String queryString="from Station where parentId=?";
		Object[]values= {station};
		return issuanceStationDao.find(queryString, values);
	}

	@Override
	@Transactional(readOnly=false)
	public Station getStationByName(String name) {
		// TODO Auto-generated method stub
		return issuanceStationDao.get("from Station where name=?", new Object[] {name});
	}

}
