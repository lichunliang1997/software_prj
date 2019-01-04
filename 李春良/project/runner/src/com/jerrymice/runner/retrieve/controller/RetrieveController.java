package com.jerrymice.runner.retrieve.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jerrymice.runner.register.email.Email;
import com.jerrymice.runner.retrieve.service.RetrieveService;

@Controller
public class RetrieveController {

	@Resource(name="retrieveServiceId")
	private RetrieveService rs;
	
	@RequestMapping(value="/retrieve")
	public String change(HttpServletRequest request,HttpSession session, Model model) {
		Email emails = (Email) session.getAttribute("email");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String code = request.getParameter("code");
		String repassword = request.getParameter("rePasswd");
		if(emails==null) {
			//要先获取验证码
			System.out.println("请先获取验证码！");
			model.addAttribute("ReMessage", "请先获取验证码！");
			return "retrieve";
		}else {
			boolean c = password.matches("^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[\\\\`\\\\~\\\\!\\\\@\\\\#\\\\$\\\\%\\\\^\\\\&\\\\*\\\\(\\\\)\\\\_\\\\+\\\\-\\\\=\\\\{\\\\}\\\\|\\\\[\\\\]\\\\:\\\\;\\\\'\\\\<\\\\>\\\\?\\\\,\\\\.]).{6,16}$");
			if(!c) {
				System.out.println("密码格式不正确");
				model.addAttribute("ReMessage", "密码格式不正确");
				return "retrieve";
			}
			if (email.equals("") || code.equals("") || password.equals("") || repassword.equals("")) {
				model.addAttribute("ReMessage", "请把注册信息填完整！");
				System.out.println("请把注册信息填完整！");
				return "retrieve";
			} else {
				if (rs.isExist(email)) {
					if (!code.equals(emails.getCode())) {
						System.out.println("验证码输入错误，请重新获取！");
						model.addAttribute("ReMessage", "验证码输入错误，请重新获取！");
						return "retrieve";
					} else {
						    rs.isOk(email,repassword);
							System.out.println("成功设置密码！");
							model.addAttribute("ReMessage", "成功设置密码");
							return "login";
						}
					}
					}
				}
		return "";
			}
	
	@RequestMapping(value="/ReEmail")
	public String sendMail(HttpServletRequest request, HttpSession session,Model model) {
		Email emails = new Email();
		String email = request.getParameter("email");
		emails.sendEmail(email);
		session.setAttribute("email", emails);
		System.out.println(emails);
		model.addAttribute("ReMessage", "邮件发送成功");
		return "retrieve";
	}
}
