package com.jerrymice.runner.pay.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jerrymice.runner.entity.Information;
import com.jerrymice.runner.entity.Order;
import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.pay.service.OrderUpdateServiceImpl;
import com.jerrymice.runner.pay.service.PayServiceImpl;

@Controller
public class PayController {
	@Resource(name="payServiceId")
	private PayServiceImpl payServiceImpl;
	@Resource(name="orderUpdateServiceId")
	private OrderUpdateServiceImpl orderUpdateServiceImpl;
	@RequestMapping("/pay")
	public String updateBalance(@RequestParam ("ps")String ps, HttpServletRequest request,HttpSession session) {
		
		User user=(User) session.getAttribute("user");
		Order order=(Order) session.getAttribute("unPayOrder");
		Information information=new Information();
		//information=user.getInformation();
		information=user.getInformation();
		String ups=information.getPaymentPassword();
		int price=order.getMoney();
		int aBalance=information.getaBalance()-price;
		information.setaBalance(aBalance);
		//payServiceImpl.updateBa(information);
		if (!ps.equals(ups)) {
			request.setAttribute("err", 1);//密码错误
			return "epay";
			
		}else if(aBalance<0) {
			request.setAttribute("err",2);//余额不足
			return "epay";
		}else{
			order.setStatus(0);
			orderUpdateServiceImpl.updateOrder(order);
			payServiceImpl.updateBa(information);
			request.setAttribute("order", order);
			session.setAttribute("unPayOrder", null);
			return "paySuccess";//支付成功
		}
	}
	@RequestMapping("/topay")
	public String toPay(HttpServletRequest request,HttpSession session) {
		String soid = request.getParameter("oid");
		Object[] oid = {soid};
		Order order = this.orderUpdateServiceImpl.findByOId(oid);
		session.setAttribute("unPayOrder", order);
		return "epay";
	}
}
