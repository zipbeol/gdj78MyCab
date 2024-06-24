package com.my.cab.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.my.cab.dao.CalendarDAO;


@Service
public class CalendarService {
	
	Logger logger = LoggerFactory.getLogger(getClass());

	private final CalendarDAO calendarDao;
	
	public CalendarService(CalendarDAO calendarDao) {
		this.calendarDao = calendarDao;
	}
	
	public List<Map<String, Object>> calListCall() {
		List<Map<String, Object>> getCalList = calendarDao.calListCall();
		
		for (Map<String, Object> map : getCalList) {
			logger.info("스케줄 리스트 제목 :"+map.get("schedule_name"));
			logger.info("스케줄 리스트 시작날짜 :"+map.get("schedule_start_date"));
			logger.info("스케줄 리스트 종료날짜 :"+map.get("schedule_end_date"));
		}
		 
		
		return getCalList;
	}

	public List<Map<String, Object>> dayCalListCall(String selectedDay) {
		List<Map<String, Object>> getDayCalList = calendarDao.dayCalListCall(selectedDay);
		for (Map<String, Object> map : getDayCalList) {
			logger.info("getDayCalList get conetent : "+map.get("schedule_content"));
		}
		
		return getDayCalList;
	}

}
