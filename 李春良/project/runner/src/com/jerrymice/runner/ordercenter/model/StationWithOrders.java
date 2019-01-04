package com.jerrymice.runner.ordercenter.model;

import java.util.ArrayList;
import java.util.List;

import com.jerrymice.runner.entity.Order;
import com.jerrymice.runner.entity.Station;

public class StationWithOrders {
	private Station station;
	private List<Order>orderlist=new  ArrayList<>();
	public Station getStation() {
		return station;
	}
	public void setStation(Station station) {
		this.station = station;
	}
	public List<Order> getOrderlist() {
		return orderlist;
	}
	public void setOrderlist(List<Order> orderlist) {
		this.orderlist = orderlist;
	}
	
}
