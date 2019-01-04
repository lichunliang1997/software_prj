package com.jerrymice.runner.ordercenter.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jerrymice.runner.entity.Order;
import com.jerrymice.runner.entity.Station;
import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.ordercenter.model.StationWithOrders;
import com.jerrymice.runner.ordercenter.service.OrderCenterOrderService;
import com.jerrymice.runner.ordercenter.service.OrderCenterStationService;
import com.jerrymice.runner.util.time.TimeUtils;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

@Controller
public class OrderCenterController {
	@Resource(name="orderCenterStationServiceId")
	private OrderCenterStationService orderCenterStationService; 
	@Resource(name="orderCenterOrderServiceId")
	private OrderCenterOrderService orderCenterOrderService;
	@Resource(name="timeUtilsId")
	private TimeUtils timeUtils;
	
	@RequestMapping(value="/center/station",produces = {"text/html;charset=utf-8"})
	@ResponseBody
	public String displayStation(@RequestParam("name")String schoolName) {
		List<Station>stationList=orderCenterStationService.getStationsBySchoolName(schoolName);
		List<StationWithOrders>swoList=new ArrayList<>();
		for (Station station : stationList) {
			StationWithOrders swo=new StationWithOrders();
			swo.setStation(station);
			for (Order order : station.getOrderList()) {
				if(order.getStatus()==0/*&&timeUtils.calculate(order.getDeliveryTime())>0&&!timeUtils.isOverdue(order.getInvoiceTime())*/) {
					swo.getOrderlist().add(order);
				}
				/*else {
					order.setStatus(5);
					orderCenterOrderService.updateOrder(order);
				}*/
			}
			swoList.add(swo);
		}
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONArray jsonArray= JSONArray.fromObject(swoList,jsonConfig);
		String jsonString=jsonArray.toString();
		return jsonString;
	}
	
	@RequestMapping(value="/orderlist",produces = {"text/html;charset=utf-8"})
	public String forwardOrderList(@RequestParam("lnglat")String lnglat,Model model) {
		Station station=orderCenterStationService.getStationByLnglat(lnglat);
		List<Order>tempList=station.getOrderList();
		List<Order>orderList=new ArrayList<>();
		for (Order order : tempList) {
			if(order.getStatus()==0&&timeUtils.calculate(order.getDeliveryTime())>0) {
				System.out.println(timeUtils.calculate(order.getDeliveryTime()));
				String overTime=(timeUtils.calculate(order.getDeliveryTime())/60)+"小时"+(timeUtils.calculate(order.getDeliveryTime())-(timeUtils.calculate(order.getDeliveryTime())/60)*60)+"分";
				order.setDeliveryTime(overTime);
				orderList.add(order);
			}
		}
		model.addAttribute("orderList", orderList);
		return "oc_orderList";
	}
	
	@RequestMapping(value="/order/detail",produces = {"text/html;charset=utf-8"})
	public String getOrderDetails(@RequestParam("id")String id,Model model) {
		Order order=orderCenterOrderService.getOrderById(Integer.parseInt(id));
		System.out.println(order);
		User user=order.getInvoiceId();
		model.addAttribute("invoice", user);
		model.addAttribute("order", order);
		return "oc_orderDetails";
	}
	
}
