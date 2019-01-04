package com.jerrymice.runner.message.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jerrymice.runner.entity.SystemNotice;
import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.manage.user.service.ManageUserService;
import com.jerrymice.runner.message.service.SystemMessageService;
import com.jerrymice.runner.util.chat.ChatUtils;

@Controller
public class SystemMessageController {
	@Resource(name="systemMessageServiceId")
	private SystemMessageService systemMessageService;
	@Resource(name="chatUtilsId")
	private ChatUtils chatUtils;
	@Resource(name="manageUserServiceId")
	private ManageUserService manageUserService;
	@RequestMapping("/sysMsg")
	public String findSys(HttpServletRequest request) {
		User user=(User) request.getSession().getAttribute("user");
		String queryString ="from SystemNotice sn where sn.uId=?";
		Object[] values={user};
		List<SystemNotice> list=this.systemMessageService.findSysMsg(queryString, values);
		request.setAttribute("sysmsg", list);
		return "systemMessage";
	}
	@RequestMapping("/send/notice/user")
	@ResponseBody
	public String sendSystemMsg(HttpSession session,@RequestParam("id")String id,@RequestParam("content")String content) {
		User uId=manageUserService.getUser(Integer.parseInt(id));
		Timestamp timestamp=new Timestamp(System.currentTimeMillis());
		SystemNotice systemNotice=new SystemNotice();
		systemNotice.setContent(content);
		systemNotice.setId(null);
		systemNotice.setTimes(timestamp);
		systemNotice.setStatus(0);
		systemNotice.setuId(uId);
		systemMessageService.saveSystemMessage(systemNotice);
		chatUtils.sendMessageToUser(id, content);
		return null;
	}
}
