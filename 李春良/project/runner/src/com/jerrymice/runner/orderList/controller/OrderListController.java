package com.jerrymice.runner.orderList.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jerrymice.runner.entity.Order;
import com.jerrymice.runner.orderList.service.OrderListService;

@Controller
/*@RequestMapping("/orderList")*/
public class OrderListController {
	@Resource(name="orderListServiceId")
	private OrderListService orderListService;
	
	/*查找所有订单*/
	@RequestMapping(value="/showOrder")
	public String showOrder(HttpServletRequest httpServletReques){
		List<Order> list = orderListService.findAll();
		httpServletReques.setAttribute("orderList",list);
		return "oc_orderList";
	}
	
	
	
	
}
