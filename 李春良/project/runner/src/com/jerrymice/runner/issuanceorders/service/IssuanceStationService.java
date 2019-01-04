package com.jerrymice.runner.issuanceorders.service;

import java.util.List;

import com.jerrymice.runner.entity.Station;

public interface IssuanceStationService {
	public List<Station>getStations(String schoolName);
	public Station getStationByName(String name);
}
