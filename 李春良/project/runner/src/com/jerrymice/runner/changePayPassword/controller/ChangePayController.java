package com.jerrymice.runner.changePayPassword.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jerrymice.runner.changePayPassword.service.PayPasswordService;
import com.jerrymice.runner.entity.Information;

@Controller
public class ChangePayController {

	@Resource(name="payPasswordServiceId")
	private PayPasswordService pps;
	
	@RequestMapping(value="/payController")
	public String changePay(HttpServletRequest request, HttpSession session,Model model) {
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		String rePassword = request.getParameter("rePassword");
		Information info = (Information) session.getAttribute("info");
		System.out.println(info);
		boolean b = newPassword.matches("[1-9]{6}");
		if(!b) {
			System.out.println("密码应为6位数字");
			model.addAttribute("payMessage","密码格式不正确");
			return "paymentPassword";
		}
		if(oldPassword.equals(info.getPaymentPassword()) && newPassword.equals(rePassword)) {
			info.setPaymentPassword(newPassword);
			pps.updateInformation(info);
			System.out.println("更改成功");
			model.addAttribute("payMessage","更改成功");
			return "paymentPassword";
		}
		System.out.println("更改失败:原密码可能不正确");
		model.addAttribute("payMessage","更改失败:原密码可能不正确");
		return "paymentPassword";
	}
}
