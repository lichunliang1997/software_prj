package com.jerrymice.runner.register.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jerrymice.runner.entity.Information;
import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.register.email.CreateId;
import com.jerrymice.runner.register.email.Email;
import com.jerrymice.runner.register.service.RegisterService;

@Controller
public class RegisterController {
	@Resource(name = "registerServiceId")
	private RegisterService re;

	@ModelAttribute
	public void save(Model model) {
		model.addAttribute("registerMessage", "请获取验证码！");
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String register(HttpServletRequest request, HttpSession session, Model model) {
		Email emails = (Email) session.getAttribute("email");
		String password = request.getParameter("passwd");
		String email = request.getParameter("email");
		String code = request.getParameter("code");
		String repassword = request.getParameter("rePasswd");
		if (emails == null) {
			model.addAttribute("registerMessage", "请获取验证码！");
			System.out.println("请先获取验证码");
			return "register";
		} else {
			
			boolean b = email.matches("[a-zA-Z0-9]{1,10}@[a-zA-Z0-9]{1,5}\\.[a-zA-Z0-9]{1,5}");
			boolean c = password.matches("^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[\\\\\\\\`\\\\\\\\~\\\\\\\\!\\\\\\\\@\\\\\\\\#\\\\\\\\$\\\\\\\\%\\\\\\\\^\\\\\\\\&\\\\\\\\*\\\\\\\\(\\\\\\\\)\\\\\\\\_\\\\\\\\+\\\\\\\\-\\\\\\\\=\\\\\\\\{\\\\\\\\}\\\\\\\\|\\\\\\\\[\\\\\\\\]\\\\\\\\:\\\\\\\\;\\\\\\\\'\\\\\\\\<\\\\\\\\>\\\\\\\\?\\\\\\\\,\\\\\\\\.]).{6,16}$");
			if(!b) {
				System.out.println("邮箱格式不正确");
				model.addAttribute("registerMessage", "邮箱格式不正确");
				return "register";
			}
			if(!c) {
				System.out.println("密码格式不正确");
				model.addAttribute("registerMessage", "密码格式不正确");
				return "register";
			}
			if (email.equals("") || code.equals("") || password.equals("") || repassword.equals("")) {
				model.addAttribute("registerMessage", "请补充完信息");
				System.out.println("请把注册信息填完整！");
				return "register";
			} else {
				if (!re.isExist(email)) {
					if (!password.equals(repassword)) {
						model.addAttribute("registerMessage", "两次密码输入不一致");
						System.out.println("两次密码输入不一样");
						return "register";
					} else {
						if (!code.equals(emails.getCode())) {
							model.addAttribute("registerMessage", "验证码输入错误，请重新获取！");
							System.out.println("验证码输入错误，请重新获取！");
							return "register";
						} else {
							CreateId createId = new CreateId(4,5);
							int n = Math.abs((int)(createId.nextId()));
							User user = new User();
							Information information = new Information();
							 information.setaBalance(0);
							 information.setPaymentPassword("000000");
							user.setInformation(information);
							user.setEmail(email);
							user.setPassword(password);
							user.setHeadPortrait("images/defaultImg.jpg");
							user.setNickname("用户名"+n);
							user.setId(n);
							user.setStatus(0);
							information.setUser(user);
							re.saveUser(user);
							return "login";
						}
					}
				}
			}
		}
		System.out.println("此邮箱已经注册，请更换邮箱注册！");
		model.addAttribute("registerMessage", "此邮箱已经注册，请更换邮箱注册！");
		return "register";
	}

	@RequestMapping(value = "/sendEmail")
	public String sendMail(HttpServletRequest request, HttpSession session,Model model) {
		Email email = new Email();
		String emails = request.getParameter("email");
		email.sendEmail(emails);
		session.setAttribute("email", email);
		System.out.println(email);
		model.addAttribute("registerMessage", "邮件发送成功");
		return "register";
	}

}
