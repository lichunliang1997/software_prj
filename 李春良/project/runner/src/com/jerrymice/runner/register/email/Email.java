package com.jerrymice.runner.register.email;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;

public class Email {
	//发件人地址
    public static final String senderAccount = "bch1037@163.com";
    //发件人账号授权码
    public static String senderPassword = "bch123456";
    //验证码
    private String code;
    //发送验证码的时间
    private Date createTime;
    //用户提交注册的时间
    private Date submitTime;
    
    
    /**
     * 在创建对象便生成验证码
     */
    public Email() {
    	this.setCode(Email.creatCode());
	}


    /**
     * 生成验证码(6位)
     * @return
     */
	public static String creatCode() {
    	return String.valueOf(((int)((Math.random()*9+1)*100000)));
    }
    
    
    /**
     * 创建邮件实例
     * @param session
     * @param recipientAddress
     * @return
     * @throws MessagingException
     * @throws javax.mail.MessagingException 
     * @throws AddressException 
     */
	public  MimeMessage getMimeMessage(Session session,String recipientAddress) throws MessagingException, AddressException, javax.mail.MessagingException {
        //创建一封邮件的实例对象
        MimeMessage msg = new MimeMessage(session);
        //设置发件人地址
        msg.setFrom(new InternetAddress(senderAccount));
        /**
         * 设置收件人地址(可以增加多个收件人、抄送、密送)，
         * 即下面这一行代码书写多行
         * MimeMessage.RecipientType.TO:发送
         * MimeMessage.RecipientType.CC:抄送
         * MimeMessage.RecipientType.BCC:密送
         */
        msg.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(recipientAddress));
        //设置邮件主题
        msg.setSubject("代跑侠验证码","UTF-8");
        //设置邮件正文
        msg.setContent("你好，代跑侠发给您的验证码："+this.getCode()+",请在两分钟内使用，过时无法使用！","text/html;charset=UTF-8");
        //设置邮件的发送时间，默认立即发送
        Date date = new Date();
        msg.setSentDate(date);
        this.setCreateTime(date);

        return msg;
    }
	
	/**
	 * 发送邮件
	 * @param recipientAddress  收件人地址
	 * @throws MessagingException
	 * @throws javax.mail.MessagingException 
	 */
	public void sendEmail(String recipientAddress) {
		//1.连接邮件服务器的参数配置
        Properties props = new Properties();
        //设置用户的认证方式
        props.setProperty("mail.smtp.auto","true");
        //设置传输协议
        props.setProperty("mail.transport.protocol","smtp");
        //设置发件人的SMTP服务器地址
        props.setProperty("mail.smtp.host","smtp.163.com");
        //2.创建定义整个应用程序所需的环境信息的Session
        Session session = Session.getInstance(props);
        //设置调试信息在控制台打印出来
        session.setDebug(true);
        //3.创建邮件的实例对象
        Message msg;
		try {
			msg = getMimeMessage(session,recipientAddress);
			//4.根据Session对象获取邮件传输对象Transport
	        Transport transport = session.getTransport();
	        //设置发件人的账号名和密码
	        transport.connect(senderAccount,senderPassword);
	        //发送邮件，并发送到所有收件人地址，message.getAllRecipients() 获取到的是在创建邮件对象时添加的所有收件人, 抄送人, 密送人
	        transport.sendMessage(msg,msg.getAllRecipients());
	        //如果只想发送给指定的人，可以如下写法
	        //transport.sendMessage(msg, new Address[]{new InternetAddress("xxx@qq.com")});
	        //5、关闭邮件连接
	        transport.close();
		} catch (MessagingException | javax.mail.MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}


	public Date getCreateTime() {
		return createTime;
	}


	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}


	public Date getSubmitTime() {
		return submitTime;
	}


	public void setSubmitTime(Date submitTime) {
		this.submitTime = submitTime;
	}


	@Override
	public String toString() {
		return "Email [code=" + code + ", createTime=" + createTime + ", submitTime=" + submitTime + "]";
	}
	
	
}
