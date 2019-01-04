package com.jerrymice.runner.ordercenter.service;

import java.util.List;

import com.jerrymice.runner.entity.Station;

public interface OrderCenterStationService {
	public List<Station>getStationsBySchoolName(String schoolName);
	public Station getStationByLnglat(String lnglat);
}
