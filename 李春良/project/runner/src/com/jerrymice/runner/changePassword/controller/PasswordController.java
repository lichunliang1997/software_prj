package com.jerrymice.runner.changePassword.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jerrymice.runner.changePassword.service.PasswordService;
import com.jerrymice.runner.entity.User;

@Controller
public class PasswordController {
	@Resource(name="passwrodService")
	private PasswordService ps;
	
	@RequestMapping(value="/changePassword")
	public String changePassword(HttpSession session,HttpServletRequest request,Model model) {
		User user =  (User)session.getAttribute("user");
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		String rePassword = request.getParameter("rePassword");
		boolean c = newPassword.matches("^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[\\\\`\\\\~\\\\!\\\\@\\\\#\\\\$\\\\%\\\\^\\\\&\\\\*\\\\(\\\\)\\\\_\\\\+\\\\-\\\\=\\\\{\\\\}\\\\|\\\\[\\\\]\\\\:\\\\;\\\\'\\\\<\\\\>\\\\?\\\\,\\\\.]).{6,}$");
		System.out.println(c);
		if(!c) {
			System.out.println("密码格式不正确");
			model.addAttribute("passwordMessage", "密码格式不正确");
			return "changePassword";
		}
		if(oldPassword.equals(user.getPassword()) && newPassword.equals(rePassword)) {
			user.setPassword(newPassword);
			ps.updateUser(user);
			System.out.println("更改成功");
			return "login";
		}
		
		System.out.println("更改失败");
		model.addAttribute("passwordMessage", "更改失败");
		return "changePassword";
	}
}
