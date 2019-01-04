package com.jerrymice.runner.util.time;

import java.sql.Timestamp;
import java.util.Calendar;

import org.springframework.stereotype.Repository;

@Repository(value="timeUtilsId")
public class TimeUtilsImpl implements TimeUtils {

	@Override
	public Integer calculate(String deliveryTime) {
		// TODO Auto-generated method stub
		Calendar calendar=Calendar.getInstance();
		int hours=calendar.get(Calendar.HOUR_OF_DAY);
		int minutes=calendar.get(Calendar.MINUTE);
		int currentMinutes=hours*60+minutes;
		int deliveryMinutes=Integer.parseInt(deliveryTime.split(":")[0])*60+Integer.parseInt(deliveryTime.split(":")[1]);
		System.out.println("计算是否超时："+deliveryMinutes+"(deliveryMinutes)-"+currentMinutes+"(currentMinutes)="+(deliveryMinutes-currentMinutes));
		return deliveryMinutes-currentMinutes;
	}

	@Override
	public Boolean isOverdue(Timestamp time) {
		// TODO Auto-generated method stub
		Timestamp currentTime=new Timestamp(System.currentTimeMillis());
		System.out.println("Timestamp:"+time.toString().substring(0, 10));
		System.out.println("currentTime:"+currentTime.toString().substring(0, 10));
		System.out.println("检测是否过期:Timestamp-currentTime="+time.toString().substring(0, 10).compareTo(currentTime.toString().substring(0, 10)));
		if(time.toString().substring(0, 10).compareTo(currentTime.toString().substring(0, 10))<0) {
			return true;
		}
		return false;
	}

}
