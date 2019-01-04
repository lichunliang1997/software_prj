package com.jerrymice.runner.manage.user.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jerrymice.runner.entity.Information;
import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.manage.information.service.ManageInformationService;
import com.jerrymice.runner.manage.user.service.ManageUserService;
import com.jerrymice.runner.util.img.ImgUtils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

@Controller
public class UserController {
	@Resource(name="manageUserServiceId")
	private ManageUserService manageUserService ;
	@Resource(name="imgUtilsId")
	private ImgUtils imgUtils;
	@Resource(name="manageInformationServiceId")
	private ManageInformationService manageInformationService;
	@RequestMapping("update/information")
	@ResponseBody
	public String updateInfoHandler(@RequestParam("jsonString") String jsonString,@RequestParam("userFile") MultipartFile file,HttpServletRequest request) throws IOException {
		String name=null;
		JSONObject jsonObject=JSONObject.fromObject(jsonString);
		User user=(User) request.getSession().getAttribute("user");
		Information info=user.getInformation();
		user.setWeChat(jsonObject.getString("weChat"));
		user.setQq(jsonObject.getString("qq"));
		user.setNickname(jsonObject.getString("nickname"));
		info.setName(jsonObject.getString("name"));
		info.setAge(jsonObject.getString("age"));
		info.setClazz(jsonObject.getString("clazz"));
		info.setSchool(jsonObject.getString("school"));
		info.setCollege(jsonObject.getString("college"));
		user.setInformation(info);
		if(file.getSize()>0&&file!=null) {
			Date date=new Date();
			SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyymmmddHHmmss");
			name=simpleDateFormat.format(date).toString()+file.getOriginalFilename();
			imgUtils.compressImg(file.getInputStream(), request.getServletContext().getRealPath("/images/headimages/"+name), file.getContentType());
			user.setHeadPortrait("images/headimages/"+name);
		}
		manageUserService.updateUser(user);
		manageInformationService.updateInformation(info);
		request.getSession().setAttribute("user", user);
		request.getSession().setAttribute("info", info);
		return "{'src':"+"'images/headimages/"+name+"'}";
	}
	
	private List<User> refreshUser() {
		return manageUserService.pageSearch(1, 10);
	}
	
	@RequestMapping("/add/user")
	@ResponseBody
	public String addUserHandler(@RequestParam("jsonString") String jsonString,@RequestParam("userFile") MultipartFile file,HttpServletRequest request) throws IOException {
		String name=null;
		JSONObject jsonObject=JSONObject.fromObject(jsonString);
		User user=(User)JSONObject.toBean(jsonObject,User.class);
		if(file.getSize()>0&&file!=null) {
			Date date=new Date();
			SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyymmmddHHmmss");
			name=simpleDateFormat.format(date).toString()+file.getOriginalFilename();
			imgUtils.compressImg(file.getInputStream(), request.getServletContext().getRealPath("/images/headimages/"+name), file.getContentType());
			user.setHeadPortrait("images/headimages/"+name);
		}else {
			name="defaultuser.png";
			user.setHeadPortrait("images/headimages/"+name);
		}
		Information information=new Information();
		user.setInformation(information);
		information.setUser(user);
		manageUserService.saveUser(user);
		request.getSession().setAttribute("userList", refreshUser());
		return "{status:true}";
	}
	
	@RequestMapping("/update/user")
	@ResponseBody
	public String updateUserHandler(@RequestParam("jsonString") String jsonString,@RequestParam("userFile") MultipartFile file,HttpServletRequest request) throws IOException {
		String name=null;
		JSONObject jsonObject=JSONObject.fromObject(jsonString);
		User user=(User)JSONObject.toBean(jsonObject,User.class);
		if(file.getSize()>0&&file!=null) {
			Date date=new Date();
			SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyymmmddHHmmss");
			name=simpleDateFormat.format(date).toString()+file.getOriginalFilename();
			imgUtils.compressImg(file.getInputStream(), request.getServletContext().getRealPath("/images/headimages/"+name), file.getContentType());
			user.setHeadPortrait("images/headimages/"+name);
		}
		manageUserService.updateUser(user);
		return "{'src':"+"'images/headimages/"+name+"'}";
	}
	
	@RequestMapping(value="/get/user/id",produces = {"text/html;charset=utf-8"})
	@ResponseBody
	public String getUserByIdHandler(@RequestParam("id") String id) {
		User user=manageUserService.getUser(Integer.parseInt(id));
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONObject jsonObject=JSONObject.fromObject(user,jsonConfig);
		String jsonString=jsonObject.toString();
		return jsonString;
	}
	
	@RequestMapping(value="/get/user/email",produces = {"text/html;charset=utf-8"})
	@ResponseBody
	public String getUserByEmailHandler(@RequestParam("Email") String email) {
		String queryString="from User where email=?";
		Object[]values= {email};
		User user=manageUserService.getUser(queryString, values);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONObject jsonObject=JSONObject.fromObject(user,jsonConfig);
		String jsonString=jsonObject.toString();
		return jsonString;
	}

	@RequestMapping(value="/add/more/user",produces = {"text/html;charset=utf-8"})
	@ResponseBody
	public String getMoreUserHandler(@RequestParam("page") String page) {
		int searchPage=Integer.parseInt(page);
		List<User>userList=manageUserService.pageSearch(searchPage, 10);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		 JSONArray jsonArray= JSONArray.fromObject(userList,jsonConfig);
		String jsonString=jsonArray.toString();
		return jsonString;
	}
	
	@RequestMapping(value="/delete/user",produces = {"text/html;charset=utf-8"})
	@ResponseBody
	public String deleteUserHandler(@RequestParam("id") String id) {
		manageUserService.deleteUser(manageUserService.getUser(Integer.parseInt(id)));
		return "{'status':true}";
	}
}
