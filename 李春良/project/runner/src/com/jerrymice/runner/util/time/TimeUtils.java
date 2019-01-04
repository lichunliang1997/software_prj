package com.jerrymice.runner.util.time;

import java.sql.Timestamp;

public interface TimeUtils {
	public Integer calculate(String deliveryTime);
	public Boolean isOverdue(Timestamp time);
}
