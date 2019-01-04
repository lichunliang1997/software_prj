package com.jerrymice.runner.index.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jerrymice.runner.entity.Order;
import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.index.service.IndexService;
@Controller
public class IndexController {
	@Resource(name="indexServiceId") 
	private  IndexService indexService;
	@RequestMapping("/index")
	public String deliverys(HttpServletRequest request,HttpSession session) {
		String  queryString="from Order O where  O.invoiceId=? and O.status=? or O.status=? or O.status=?";
		String  queryString1="from Order O where  O.invoiceId=? and O.status=? or O.status=?";
		User l=new User();
		l = (User) session.getAttribute("user");
		Object[] values1={l,0,1,2};
		Object[] values2= {l,3,6};
		Object[] status= {"未接单","运送中","待接单方确认","已完成","已取消","已过期","接单方运送中","接单方已完成","已完成"};
		int count=3;
		List<Order> list1=this.indexService.findOrder(count, queryString, values1);
		List<Order> list2=this.indexService.findOrder(count, queryString1, values2);
		request.getServletContext().setAttribute("uncomplete",list1);
		request.getServletContext().setAttribute("complete", list2);
		request.setAttribute("status", status);
		return "home";
	}
	
}
