package com.jerrymice.runner.login.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jerrymice.runner.entity.Information;
import com.jerrymice.runner.entity.Order;
import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.login.service.LoginService;
import com.jerrymice.runner.ordercenter.service.OrderCenterOrderService;
import com.jerrymice.runner.util.time.TimeUtils;

@Controller
public class LoginController {

	@Resource(name = "loginServiceId")
	private LoginService loginService;
	@Resource(name="orderCenterOrderServiceId")
	private OrderCenterOrderService orderCenterOrderService;
	@Resource(name="timeUtilsId")
	private TimeUtils timeUtils;
	
	
	/**
	 * 登入
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/login")
	public String login(HttpServletRequest request, HttpSession session,Model model) {
		String email = request.getParameter("email");
		String passwd = request.getParameter("password");
		if (email=="" || passwd=="") {
			model.addAttribute("loginMessage", "请补充完信息！");
			System.out.println("请补充完信息！");
			return "login";
		}else {
			if(loginService.isExist(email)) {
				if(loginService.islogin(email, passwd)) {
					//todo跳转成功页面 
					User user = loginService.getUser(email, passwd);
					Information info = loginService.getInfo(user);
					session.setAttribute("user", user);
					session.setAttribute("info", info);
					System.out.println("成功登陆");
					System.out.println(info);
					System.out.println(user);
					return "index";
				}else {
					model.addAttribute("loginMessage", "密码错误");
					System.out.println("密码错误");
					return "login";
				}
			}else {
				model.addAttribute("loginMessage", "该用户不存在");
				System.out.println("用户不存在");
				return "login";
			}
		}
	}
	
	@RequestMapping(value="/signOut")
	public String singOut(HttpSession session) {
		session.setAttribute("user", null);
		session.setAttribute("info", null);
		return"login";
	}

}
