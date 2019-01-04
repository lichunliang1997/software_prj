package com.jerrymice.runner.change.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jerrymice.runner.change.service.ChangeService;
import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.register.email.Email;

@Controller
public class ChangeController {

	@Resource(name = "changeServiceId")
	private ChangeService cs;

	@RequestMapping(value = "/changePasswd")
	public String changeEmail( HttpServletRequest request,Model model,HttpSession session) {
		User user =  (User)session.getAttribute("user");
//		String oldEmail = (String) session.getAttribute("user");
		String oldEmail = user.getEmail();
		String newEmail = request.getParameter("email");
		String code = request.getParameter("code");
		Email email = (Email) session.getAttribute("email");
		if (email == null) {
			model.addAttribute("emailMessage","请先获取验证码");
			System.out.println("请先获取验证码！");
			return "changeEmail";
		} else {
			if (newEmail == "" || code == "") {
				System.out.println("请补充完信息");
				model.addAttribute("emailMessage","请补充完信息");
				return "changeEmail";
			} else {
				if(!cs.isExist(newEmail)) {
				if (code.equals(email.getCode())) {
					cs.updateUser(oldEmail, newEmail);
					System.out.println("成功更改！");
					session.setAttribute("user", newEmail);
					model.addAttribute("emailMessage","成功更改");
					return "changeEmail";
				}
				}else {
					System.out.println("此邮箱已经注册");
					model.addAttribute("emailMessage","此邮箱已经注册");
					return "changeEmail";
				}
			}
		}
		return "changeEmail";
	}
	
	@RequestMapping(value="/changeEmail")
	public String sendMail(HttpServletRequest request, HttpSession session,Model model) {
		Email email = new Email();
		String emails = request.getParameter("email");
		email.sendEmail(emails);
		session.setAttribute("email", email);
		session.setAttribute("user", "1259196774@qq.com");
		System.out.println(email);
		System.out.println("发送验证码"+emails);
		model.addAttribute("emailMessage","发送成功");
		return "changeEmail";
	}
}
