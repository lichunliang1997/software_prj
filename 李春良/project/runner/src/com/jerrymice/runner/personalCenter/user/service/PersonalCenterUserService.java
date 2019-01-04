package com.jerrymice.runner.personalCenter.user.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.jerrymice.runner.entity.User;

public interface PersonalCenterUserService {
	public Serializable saveUser(User save);
	public List<User> findAll();
	public User findByEmail(String email);
	public void saveHeadPortrait(MultipartFile file,String email);
	public void update(User user);
	public User getuser(int uid);//查询用户
}
