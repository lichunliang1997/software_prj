package com.jerrymice.runner.util.chat;

import org.springframework.stereotype.Repository;

import io.goeasy.GoEasy;
@Repository(value="chatUtilsId")
public class ChatUtilsImpl implements ChatUtils {

	@Override
	public void sendMessageToUser(String channel, String content) {
		// TODO Auto-generated method stub
		GoEasy goEasy=new GoEasy("http://rest-hangzhou.goeasy.io","BC-0d6ab878a0a24864a0c5c0e5251e50df");
		goEasy.publish(channel, content);
	}

}
