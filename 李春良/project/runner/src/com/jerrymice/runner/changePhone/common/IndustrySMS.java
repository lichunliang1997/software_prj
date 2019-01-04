package com.jerrymice.runner.changePhone.common;

import java.net.URLEncoder;

import com.jerrymice.runner.changePhone.common.Config;
import com.jerrymice.runner.changePhone.common.HttpUtil;

/**
 * 验证码通知短信接口
 * 
 * @ClassName: IndustrySMS
 * @Description: 验证码通知短信接口
 *
 */
public class IndustrySMS
{
	private static String operation = "/industrySMS/sendSMS";

	private static String accountSid = Config.ACCOUNT_SID;
	private static String to = "";
	private static String smsContent = "【代跑科技】您的验证码为123455，请于2分钟内正确输入，如非本人操作，请忽略此短信。";
	private static String code;
	
	/**
	 * 验证码通知短信
	 */
	public static void execute(String myTo)
	{
		code = creatCode();
		to = myTo;
		smsContent = "【代跑科技】您的验证码为"+code+"，请于2分钟内正确输入，如非本人操作，请忽略此短信。";
		
		String tmpSmsContent = null;
	    try{
	      tmpSmsContent = URLEncoder.encode(smsContent, "UTF-8");
	    }catch(Exception e){
	      
	    }
	    String url = Config.BASE_URL + operation;
	    
	    String body = "accountSid=" + accountSid + "&to=" + to + "&smsContent=" + tmpSmsContent
	        + HttpUtil.createCommonParam();

	    // 提交请求
	    String result = HttpUtil.post(url, body);
	    System.out.println("result:" + System.lineSeparator() + result);
	}
	
	 /**
     * 生成验证码(6位)
     * @return
     */
	public static String creatCode() {
    	return String.valueOf(((int)((Math.random()*9+1)*100000)));
    }

	public static String getCode() {
		return code;
	}

	public static void setCode(String code) {
		IndustrySMS.code = code;
	}
	
}
