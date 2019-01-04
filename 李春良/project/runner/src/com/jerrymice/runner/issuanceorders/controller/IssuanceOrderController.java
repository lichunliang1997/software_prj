package com.jerrymice.runner.issuanceorders.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jerrymice.runner.entity.Order;
import com.jerrymice.runner.entity.Station;
import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.issuanceorders.service.IssuanceOrderService;
import com.jerrymice.runner.issuanceorders.service.IssuanceStationService;
import com.jerrymice.runner.util.img.ImgUtils;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;


@Controller
public class IssuanceOrderController {
	@Resource(name="issuanceOrderServiceId")
	private IssuanceOrderService issuanceOrderService;
	@Resource(name="issuanceStationServiceId")
	private IssuanceStationService issuanceStationService;
	@Resource(name="imgUtilsId")
	private ImgUtils imgUtils;
	
	@RequestMapping("sendOrder")
	public String saveOrder(HttpServletRequest request,HttpSession session) throws IOException {
		
			User user=(User) session.getAttribute("user");
			String site = request.getParameter("tsite");//快递站点
			Station sid=issuanceStationService.getStationByName(site);
			String position = request.getParameter("position");//经纬度
			String destination = request.getParameter("destination");//送达地点
			String time = request.getParameter("time").toString();//送达时间
			System.out.println(time);
			String fee = request.getParameter("fee");//佣金
			String radio = request.getParameter("radio");//规格
			String itemNumber = request.getParameter("itemNumber");//取货码
			String remark = request.getParameter("remark");//备注
			Order order=new Order();
			Timestamp d = new Timestamp(System.currentTimeMillis()); 
			order.setDelivery(sid);
			order.setDestLnglat(position);
			order.setReceipt(destination);
			order.setDeliveryTime(time);
			order.setInvoiceTime(d);
			int money = Integer.parseInt(fee);
			order.setMoney(money);
			int size = Integer.parseInt(radio);
			order.setSize(size);
			order.setItemNumber(itemNumber);
			order.setRemarks(remark);
			order.setInvoiceId(user);
			String orderNumber = d.getTime()+user.getId().toString();
			order.setOrderNumber(orderNumber);
			order.setStatus(7);
			sid.getOrderList().add(order);
			this.issuanceOrderService.saveOrder(order);
			session.setAttribute("unPayOrder", order);
			return "epay";
	}
	
	@RequestMapping(value="/display/station",produces = {"text/html;charset=utf-8"})
	@ResponseBody
	public String displayStation(@RequestParam("schooName")String schoolName) {
		List<Station>stationList=issuanceStationService.getStations(schoolName);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONArray jsonArray= JSONArray.fromObject(stationList,jsonConfig);
		String jsonString=jsonArray.toString();
		return jsonString;
	}
}
