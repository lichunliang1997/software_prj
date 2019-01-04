package com.jerrymice.runner.changePhone.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jerrymice.runner.changePhone.common.IndustrySMS;
import com.jerrymice.runner.changePhone.service.PhoneService;
import com.jerrymice.runner.entity.Information;

@Controller
public class PhoneController {

	@Resource(name="phoneServiceId")
	private PhoneService ps;
	
	@RequestMapping(value="/sendCode")
	public String sendCode(HttpServletRequest request,HttpSession session,Model model) {
		String phoneNumber = request.getParameter("phoneNumber");
		// 获取开发者账号信息
//		 AccountInfo.execute();

		// 验证码通知短信接口
		 IndustrySMS.execute(phoneNumber);
		 session.setAttribute("phoneCodeNumber", IndustrySMS.getCode());
		 System.out.println("手机验证码是："+IndustrySMS.getCode());
		 model.addAttribute("phoneMessage", "发送成功");
		return "changePhone";
	}
	
	/**
	 * phone 手机号
	 * phoneCode  页面传来的验证码
	 * phoneCodeNumber   发送的验证码
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/changePhone")
	public String changePhone(HttpServletRequest request,HttpSession session,Model model) {
		String phone = request.getParameter("phone");
		String phoneNumber = request.getParameter("phoneNumber");
		String phoneCodeNumber = (String) session.getAttribute("phoneCodeNumber");
		Information info = (Information) session.getAttribute("info");
		
		System.out.println(phone);
		System.out.println(phoneNumber);
		System.out.println(phoneCodeNumber);
		
		if(phoneCodeNumber == null) {
			System.out.println("请先获取验证码");
			model.addAttribute("phoneMessage", "请先获取验证码");
			return "changePhone";
	    }else {
		if(phone.equals(null) || phoneNumber.equals(null)) {
			System.out.println("请补充完整数据");
			model.addAttribute("phoneMessage", "请补充完整数据");
			return "changePhone";
		}
		else {
			if(phoneNumber.equals(phoneCodeNumber)) {
				info.setPhone(phone);
				ps.updatePhone(info);
				System.out.println("成功更改");
				model.addAttribute("phoneMessage", "成功更改");
				return "changePhone";
			}
		}
	}
		System.out.println("出错了");
		model.addAttribute("phoneMessage", "出错了");
		return "changePhone";
	}
}
