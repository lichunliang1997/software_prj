package com.jerrymice.runner.personalCenter.user.service;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.personalCenter.user.dao.PersonalCenterUserDao;
@Service(value="PersonalCenterUserServiceImpl")
public class PersonalCenterUserServiceImpl implements PersonalCenterUserService {
	@Resource(name="PersonalCenterUserDaoImpl")
	private PersonalCenterUserDao PersonalCenterUserDao;
	@Override
	@Transactional(readOnly=false)
	/*存入user对象*/
	public Serializable saveUser(User user) {
		// TODO Auto-generated method stub
		return this.PersonalCenterUserDao.save(user);
	}
	/*查询所有*/
	@Transactional(readOnly=false)
	public List<User> findAll(){
		List<User> list = new ArrayList<User>();
		list = PersonalCenterUserDao.find();
		return list;
	}
	/*邮箱查询*/
	@Transactional(readOnly=false)
	public User findByEmail(String email) {
		String hql = "from User u where u.email=?";
		User user = PersonalCenterUserDao.get(hql, new Object[] {email});
		return user;
		
		
	}
	/*保存上传的头像到服务器*/
	@Transactional(readOnly=false)
	@Override
	public void saveHeadPortrait(MultipartFile file,String email) {
		// TODO Auto-generated method stub
		String path = "images/personalCenter/";
		String fileName = "123456789";
		File targetFile = new File(path, fileName);
		try {
			file.transferTo(targetFile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	@Override
	@Transactional(readOnly=false)
	public void update(User user) {
		// TODO Auto-generated method stub
		this.PersonalCenterUserDao.update(user);
	}

	@Override
	public User getuser(int uid) {
		// TODO Auto-generated method stub
		return 	this.PersonalCenterUserDao.get(uid);
	}
}
