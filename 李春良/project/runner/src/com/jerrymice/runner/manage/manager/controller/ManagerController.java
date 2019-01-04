package com.jerrymice.runner.manage.manager.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jerrymice.runner.entity.Manager;
import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.manage.manager.service.ManagerService;
import com.jerrymice.runner.manage.user.service.ManageUserService;

import net.sf.json.JSONObject;

@Controller
public class ManagerController {
	@Resource(name="managerServiceId")
	private ManagerService managerService;
	@Resource(name="manageUserServiceId")
	private ManageUserService manageUserService;
	@RequestMapping("/manager/login")
	@ResponseBody
	public  String managerLoginHandler(HttpServletRequest request,@RequestParam("jsonString") String jsonString) {
		JSONObject jsonObject=JSONObject.fromObject(jsonString);
		Manager manager=(Manager) JSONObject.toBean(jsonObject, Manager.class);
		if(managerService.login(manager.getUsername(), manager.getPassword())) {
			request.getSession().setAttribute("manager", manager);
			List<User>userList=manageUserService.pageSearch(1, 10);
			request.getSession().setAttribute("userList", userList);
			return "{'status':true}";
		}
		return "{'status':false}";
	}
}
