package com.jerrymice.runner.personalCenter.user.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jerrymice.runner.entity.Information;
import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.personalCenter.comment.service.PersonalCenterCommentService;
import com.jerrymice.runner.personalCenter.information.service.PersonalCenterInformationService;
import com.jerrymice.runner.personalCenter.order.service.PersonalCenterOrderService;
import com.jerrymice.runner.personalCenter.user.service.PersonalCenterUserService;
import com.jerrymice.runner.util.img.ImgUtils;

@Controller
public class PersonalCenterUserController {
	@Resource(name="PersonalCenterUserServiceImpl")
	private PersonalCenterUserService PersonalCenterUserService;
	@Resource(name="PersonalCenterInformationServiceImpl")
	private PersonalCenterInformationService PersonalCenterInformationService;
	@Resource(name="PersonalCenterOrderServiceImpl")
	private PersonalCenterOrderService PersonalCenterOrderService;
	@Resource(name="PersonalCenterCommentServiceImpl")
	private PersonalCenterCommentService PersonalCenterCommentService;
	@Resource(name="imgUtilsId")
	private ImgUtils imgUtils;
	@RequestMapping(value="/add/money")
	@ResponseBody
	public String addMoney(@RequestParam("money")String money,HttpSession session) {
		int m=Integer.parseInt(money);
		User user=(User) session.getAttribute("user");
		m=m+user.getInformation().getaBalance();
		Information information=user.getInformation();
		information.setaBalance(m);
		PersonalCenterInformationService.update(information);
		user.setInformation(information);
		session.setAttribute("user", user);
		session.setAttribute("info", information);
		return "{money:"+m+"}";
	}
	
	/*
	 * 个人中心主页信息展示
	 */
	@RequestMapping(value="/showMassages")
	public String showHeadPortrait(Model model,HttpServletRequest request) {
		//得到用户基本信息和详细信息
		User user = (User) request.getSession().getAttribute("user");
		Information information = PersonalCenterInformationService.findById(user.getId());
		
		//获取头像、昵称等界面展示所需信息
		String nickname = user.getNickname();
		String headportrait = user.getHeadPortrait();
		String age = information.getAge();
		String sex = information.getSex();
		String image = information.getOppositeImage();
		User iuid = (User) request.getSession().getAttribute("user");
		User u = this.PersonalCenterUserService.getuser(iuid.getId());
	    request.getSession().setAttribute("user", u);
		model.addAttribute("nickname", nickname);
		model.addAttribute("headportrait", headportrait);
		model.addAttribute("age", age);
		model.addAttribute("sex", sex);
		model.addAttribute("image", image);
		
		
		return "pc_home";
	}
	
	
	/*
	 * 资料卡信息展示
	 */
	@RequestMapping(value="/showInformation",method=RequestMethod.GET)
	public String showInformation(Model model,HttpServletRequest request) {
		//得到用户基本信息和详细信息
		User user = (User) request.getSession().getAttribute("user");
		Information information = PersonalCenterInformationService.findById(user.getId());
		
		//获取头像、昵称等界面展示所需信息
		String nickname = user.getNickname();
		String headportrait = user.getHeadPortrait();
		String email = user.getEmail();
		String sex = information.getSex();
		String age = information.getAge();
		String school = information.getSchool();
		int total = PersonalCenterOrderService.orderCounts(user);
		int finished = PersonalCenterOrderService.orderFinished(user);
		int unfinished = PersonalCenterOrderService.orderUnfinished(user);
		int two = PersonalCenterCommentService.getTwoScore();
		int four = PersonalCenterCommentService.getFourScore();
		int six = PersonalCenterCommentService.getSixScore();
		int eight = PersonalCenterCommentService.getEightScore();
		int ten = PersonalCenterCommentService.getTenScore();
		
		
		model.addAttribute("nickname", nickname);
		model.addAttribute("headportrait", headportrait);
		model.addAttribute("email", email);
		model.addAttribute("sex", sex);
		model.addAttribute("age", age);
		model.addAttribute("school", school);
		model.addAttribute("total", total);
		model.addAttribute("finished", finished);
		model.addAttribute("unfinished", unfinished);
		model.addAttribute("two", two);
		model.addAttribute("four", four);
		model.addAttribute("six", six);
		model.addAttribute("eight", eight);
		model.addAttribute("ten", ten);
			
		
		return "pc_myInformation";
	}
	
	
	
	@RequestMapping("/upload/studentID")
	@ResponseBody
	public String addUserHandler(@RequestParam("userFile") MultipartFile file,HttpServletRequest request) throws IOException {
		String name=null;
		if(file.getSize()>0&&file!=null) {
			User user=(User) request.getSession().getAttribute("user");
			name="images/personalCenter/studentID/"+user.getId()+file.getOriginalFilename();
			imgUtils.compressImg(file.getInputStream(), request.getServletContext().getRealPath(name), file.getContentType());
			Information information=user.getInformation();
			information.setOppositeImage(name);
			PersonalCenterInformationService.update(information);
		}
		return "{status:true}";
	}
	
	/*
	 * 展示学生证
	 */
	
	@RequestMapping(value=("/showStudentID"))
	public String showStudentID(HttpServletRequest request) throws Exception{
		
		User user = (User) request.getSession().getAttribute("user");		
		Information information = PersonalCenterInformationService.findById(user.getId());
		
		String image  = information.getOppositeImage();
		String school = information.getSchool();
		request.setAttribute("image", image);
		request.setAttribute("school", school);

		
		return "pc_studentID";
		
	}
	
	
	


	
	@RequestMapping(value=("/checkMoney"))
	public String checkMoney(HttpServletRequest request) throws Exception{
		
		User user = (User) request.getSession().getAttribute("user");		
		User temp=PersonalCenterUserService.getuser(user.getId());
		request.getSession().setAttribute("user", temp);
		return "pc_wallet";
		
	}
	
	



	
	
	
	
	
	
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

