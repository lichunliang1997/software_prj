package com.jerrymice.runner.message.service;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jerrymice.runner.entity.ChatRecord;
import com.jerrymice.runner.entity.User;
import com.jerrymice.runner.manage.user.service.ManageUserService;
import com.jerrymice.runner.message.dao.ChatRecordDao;
@Repository(value="chatRecordServiceId")
public class ChatRecordServiceImpl implements ChatRecordService {
	@Resource(name="chatRecordDaoId")
	private ChatRecordDao chatRecordDao;
	@Resource(name="manageUserServiceId")
	private ManageUserService manageUserService;
	@Override
	@Transactional(readOnly=false)
	public void saveChatRecord(ChatRecord chatRecord) {
		// TODO Auto-generated method stub
		chatRecordDao.save(chatRecord);
	}
	@Override
	@Transactional(readOnly=false)
	public List<ChatRecord> searchChatRecord(String sender, String reciever) {
		// TODO Auto-generated method stub
		User user1=manageUserService.getUser(Integer.parseInt(sender));
		User user2=manageUserService.getUser(Integer.parseInt(reciever));
		String queryString="from ChatRecord where talkerId=? and uId=?";
		Object[]values1= {user1,user2};
		Object[]values2= {user2,user1};
		List<ChatRecord>tempList=chatRecordDao.find(queryString, values1);
		List<ChatRecord>list=chatRecordDao.find(queryString, values2);
		if(list!=null){
			if(tempList!=null) {
				list.addAll(tempList);
			}
			Collections.sort(list, new Comparator<ChatRecord>() {
	
				@Override
				public int compare(ChatRecord o1, ChatRecord o2) {
					// TODO Auto-generated method stub
					return o1.getTimes().compareTo(o2.getTimes());
				}
			});
			return list;
		}
		return null;
	}
	@Override
	@Transactional(readOnly=false)
	public List<ChatRecord> searchChatRecordByUser(Integer id) {
		// TODO Auto-generated method stub
		User user=manageUserService.getUser(id);
		List<ChatRecord>list1=chatRecordDao.find("from ChatRecord where talkerId=?", new Object[] {user});
		List<ChatRecord>list2=chatRecordDao.find("from ChatRecord where uId=?", new Object[] {user});
		if(list1!=null&&list1.size()>0) {
			if(list2!=null&&list2.size()>0) {
				list1.addAll(list2);
			}
			return list1;
		}else if(list2!=null&&list2.size()>0) {
			return list2;
		}
		return null;
	}

}
