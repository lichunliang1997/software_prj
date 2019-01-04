package com.jerrymice.runner.orderManagement.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jerrymice.runner.entity.Order;
import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.orderManagement.service.OrderManagementService;



@Controller
public class OrderManagementController {
	
	
	
	@Resource(name="orderManagementServiceId")
	private OrderManagementService orderManagementService;
	
	@RequestMapping("/orderIndex")
	public String orderAll(HttpServletRequest request,HttpSession session) {
		String otype = request.getParameter("status");
		User user=(User) session.getAttribute("user");
		Object[] uid = {user,user};
		if("".equals(otype)||otype==null)
		{
			List<Order> order1=this.orderManagementService.findAll(uid);
			System.out.println(order1);
			request.getServletContext().setAttribute("orderlist", order1);
		}
		else if("3".equals(otype)) {
			List<Order> order1=this.orderManagementService.findByStatus2(uid);
			request.getServletContext().setAttribute("orderlist", order1);
		}
		else if("2".equals(otype)){
			List<Order> order1=this.orderManagementService.findByStatus3(uid);
			request.getServletContext().setAttribute("orderlist", order1);
		}
		else if("1".equals(otype)) {
			List<Order> order1=this.orderManagementService.findByStatus4(uid);
			request.getServletContext().setAttribute("orderlist", order1);
		}
		else {
			int status = Integer.parseInt(otype);
			Object[] uid2 = {user,status};
			List<Order> order1=this.orderManagementService.findByStatus(uid2);
			request.getServletContext().setAttribute("orderlist", order1);
		}
		return "om_orderManage";
	}
	
	@RequestMapping("/orderDetail")
	public String orderDetail(HttpServletRequest request,HttpSession session) {
		String OId = request.getParameter("orderid");
		Object[] oid = {OId};
		Order order=new Order();
		order=this.orderManagementService.findByOId(oid);
		request.getServletContext().setAttribute("order", order);
		return "om_orderDetails";
	}
	
	@RequestMapping("/orderChange")
	public String orderChange(HttpServletRequest request,RedirectAttributes attr) {
		String otype = request.getParameter("status");
		String soid = request.getParameter("oid");
		String Sscore = request.getParameter("mark");
		String comment = request.getParameter("content");
		String SuId = request.getParameter("uId");
		String ScommentatorId = request.getParameter("commentatorId");
		int oid = Integer.parseInt(soid);
		if(otype.equals("1")) {
			this.orderManagementService.updateStatus(oid);
		}else if(otype.equals("2")) {
			this.orderManagementService.updateStatus2(oid);
		}else if(otype.equals("3")) {
			this.orderManagementService.updateStatus4(oid);
			int iuid = Integer.parseInt(SuId);
			int icommentatorId = Integer.parseInt(ScommentatorId);
			int score = Integer.parseInt(Sscore);
			User uId= new User();
			uId = this.orderManagementService.getuser(iuid);
			User commentatorId = new User();
			commentatorId = this.orderManagementService.getuser(icommentatorId);
			this.orderManagementService.saveComment(comment, uId, commentatorId, score);
			otype="2";
		}else {
			this.orderManagementService.updateStatus3(oid);
		}
		attr.addAttribute("status",otype);
		return "redirect:orderIndex";
	}
}
