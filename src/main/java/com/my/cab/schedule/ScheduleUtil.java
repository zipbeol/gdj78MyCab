package com.my.cab.schedule;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


@EnableScheduling
@Component
public class ScheduleUtil {
	
	//스케쥴러는 프로그램과 생명주기를 함께 한다. (프로그램이 켜지면 켜지고 꺼지면 꺼진다. 특정 시점 지점 불가)
	
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	//crontab
	//초 분 시 일 월 요일 년도(일반적으로 생략)
	//1 0 0 * * MON-FRI
	/*
	 * @Scheduled(cron="0/5 * * * * MON-FRI") public void cron() {
	 * logger.info("5초마다 실행"); }
	 */
	
	
	
	

}
