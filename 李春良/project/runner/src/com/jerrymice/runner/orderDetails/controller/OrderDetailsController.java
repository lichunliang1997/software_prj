package com.jerrymice.runner.orderDetails.controller;

import java.sql.Timestamp;
import java.text.ParseException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jerrymice.runner.entity.SystemNotice;
import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.message.service.SystemMessageService;
import com.jerrymice.runner.orderDetails.service.OrderDetailsService;
import com.jerrymice.runner.util.chat.ChatUtils;

@Controller
public class OrderDetailsController {
	@Resource(name="orderDetailsServiceId")
	private OrderDetailsService orderDetailsService;
	@Resource(name="chatUtilsId")
	private ChatUtils chatUtils;
	@Resource(name="systemMessageServiceId")
	private SystemMessageService systemMessageService;
	/*更改状态*/
	@RequestMapping(value="/orderDetails")
	public String changeStatus(HttpServletRequest request,RedirectAttributes attr) throws ParseException {
		String soid = request.getParameter("oid");
		int oid = Integer.parseInt(soid);
		User user=(User) request.getSession().getAttribute("user");
		this.orderDetailsService.updateStatus(oid,user);
		String content=user.getNickname()+"用户抢您发布的单啦!";
		String channel=""+this.orderDetailsService.findIssuanceUserByOrderId(oid).getId();
		System.out.println(channel);
		Timestamp timestamp=new Timestamp(System.currentTimeMillis());
		SystemNotice systemNotice=new SystemNotice();
		systemNotice.setContent(content);
		systemNotice.setId(null);
		systemNotice.setTimes(timestamp);
		systemNotice.setStatus(0);
		systemNotice.setuId(this.orderDetailsService.findIssuanceUserByOrderId(oid));
		systemMessageService.saveSystemMessage(systemNotice);
		chatUtils.sendMessageToUser(channel, content);
		return "oc_orderSuccess";
	}

}
