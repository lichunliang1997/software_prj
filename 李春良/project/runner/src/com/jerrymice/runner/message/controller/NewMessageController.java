package com.jerrymice.runner.message.controller;


import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jerrymice.runner.entity.ChatRecord;
import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.manage.user.service.ManageUserService;
import com.jerrymice.runner.message.dao.UserAndLastTime;
import com.jerrymice.runner.message.service.ChatRecordService;
import com.jerrymice.runner.util.chat.ChatUtils;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

@Controller
public class NewMessageController {
	@Resource(name="chatUtilsId")
	private ChatUtils chatUtils;
	@Resource(name="chatRecordServiceId")
	private ChatRecordService chatRecordService;
	@Resource(name="manageUserServiceId")
	private ManageUserService manageUserService;
	@RequestMapping("/showChat")
	public String searchAllChat(Model model,HttpSession session) {
		User user=(User) session.getAttribute("user");
		List<UserAndLastTime>ualtList=new ArrayList<>();
		List<ChatRecord>crList=chatRecordService.searchChatRecordByUser(user.getId());
		if(crList!=null&&crList.size()>0) {
			for (ChatRecord chatRecord : crList) {
				boolean flag=false;
				UserAndLastTime ualt=new UserAndLastTime();
				if(chatRecord.getTalkerId().getId()==user.getId()) {
					ualt.setUser(chatRecord.getuId());
				}else {
					ualt.setUser(chatRecord.getTalkerId());
				}
				ualt.setTimestamp(chatRecord.getTimes());
				for (UserAndLastTime userAndLastTime :ualtList) {
					if(userAndLastTime.getUser().getId()==ualt.getUser().getId()) {
						//Hava
						if(userAndLastTime.getTimestamp().before(ualt.getTimestamp())) {
							userAndLastTime.setTimestamp(ualt.getTimestamp());
						}
						flag=true;
					}
				}
				if(flag==false) {
					ualtList.add(ualt);
				}
			}
		}
		for (UserAndLastTime userAndLastTime : ualtList) {
			System.out.println(userAndLastTime);
		}
		model.addAttribute("chatList", ualtList);
		return "message";
	}
	
	@RequestMapping("/ready")
	public String readyChat(Model model,@RequestParam("sender")String sender,@RequestParam("reciever")String reciever) {
		List<ChatRecord>list=chatRecordService.searchChatRecord(sender, reciever);
		if(list!=null) {
			for (ChatRecord chatRecord : list) {
				System.out.println(chatRecord);
			}
		}
		User user=manageUserService.getUser(Integer.parseInt(reciever));
		model.addAttribute("otherUser",user);
		model.addAttribute("crList", list);
		return "chat";
	}
	@RequestMapping("/chat")
	@ResponseBody
	public  String chat(HttpSession session,@RequestParam("channel")String channel,@RequestParam("content")String content) {
		User talker=(User) session.getAttribute("user");
		User target=manageUserService.getUser(Integer.parseInt(channel));
		Timestamp timestamp=new Timestamp(System.currentTimeMillis());
		ChatRecord chatRecord=new ChatRecord();
		chatRecord.setId(null);
		chatRecord.setContent(content);
		chatRecord.setTalkerId(talker);
		chatRecord.setTimes(timestamp);
		chatRecord.setuId(target);
		chatRecordService.saveChatRecord(chatRecord);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONObject jsonObject=JSONObject.fromObject(chatRecord,jsonConfig);
		String jsonString=jsonObject.toString();
		chatUtils.sendMessageToUser(channel, jsonString);
		return null;
	}
}
