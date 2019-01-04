package com.jerrymice.runner.personalCenter.comment.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jerrymice.runner.personalCenter.comment.dao.PersonalCenterCommentDao;

@Service(value="PersonalCenterCommentServiceImpl")
public class PersonalCenterCommentServiceImpl implements PersonalCenterCommentService {

	@Resource(name="PersonalCenterCommentDaoImpl")
	private PersonalCenterCommentDao PersonalCenterCommentDao;
	@Override
	public int getTwoScore() {
		// TODO Auto-generated method stub
		String hql = "from CommentaryRecord c where c.score=?";
		int count = PersonalCenterCommentDao.getCount(hql, new Object[] {new Integer(2)});
		return count;
	}

	@Override
	public int getFourScore() {
		// TODO Auto-generated method stub
		String hql = "from CommentaryRecord c where c.score=?";
		int count = PersonalCenterCommentDao.getCount(hql, new Object[] {new Integer(4)});
		return count;
	}

	@Override
	public int getSixScore() {
		// TODO Auto-generated method stub
		String hql = "from CommentaryRecord c where c.score=?";
		int count = PersonalCenterCommentDao.getCount(hql, new Object[] {new Integer(6)});
		return count;
	}

	@Override
	public int getEightScore() {
		// TODO Auto-generated method stub
		String hql = "from CommentaryRecord c where c.score=?";
		int count = PersonalCenterCommentDao.getCount(hql, new Object[] {new Integer(8)});
		return count;
	}

	@Override
	public int getTenScore() {
		// TODO Auto-generated method stub
		String hql = "from CommentaryRecord c where c.score=?";
		int count = PersonalCenterCommentDao.getCount(hql, new Object[] {new Integer(10)});
		return count;
	}

}
