package com.my.cab.service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.my.cab.dao.CalendarDAO;
import com.my.cab.dto.CalendarDTO;

@Service
public class CalendarService {

	Logger logger = LoggerFactory.getLogger(getClass());

	private final CalendarDAO calendarDao;

	public CalendarService(CalendarDAO calendarDao) {
		this.calendarDao = calendarDao;
	}

	public List<Map<String, Object>> calListCall() {
		List<Map<String, Object>> getCalList = calendarDao.calListCall();

		/*
		 * for (Map<String, Object> map : getCalList) {
		 * logger.info("스케줄 리스트 제목 :"+map.get("schedule_name"));
		 * logger.info("스케줄 리스트 시작날짜 :"+map.get("schedule_start_date"));
		 * logger.info("스케줄 리스트 종료날짜 :"+map.get("schedule_end_date")); }
		 */

		return getCalList;
	}

	/*
	 * public List<Map<String, Object>> dayCalListCall(String selectedDay) {
	 * List<Map<String, Object>> getDayCalList =
	 * calendarDao.dayCalListCall(selectedDay);
	 * 
	 * for (Map<String, Object> map : getDayCalList) {
	 * logger.info("getDayCalList get conetent : "+map.get("schedule_content")); }
	 * 
	 * 
	 * return getDayCalList; }
	 */

	public Map<String, Object> createSchedule(CalendarDTO calendarDTO) {
		Map<String, Object> map = new HashMap<String, Object>();
		LocalDateTime dateTime = calendarDTO.getSchedule_end_date();
		logger.info("create-datetime" + dateTime.getHour() + "//" + dateTime.getMinute() + "" + dateTime.getSecond());
		// 하루종일 일정 시간 수정
		if (dateTime.getHour() == 0 & dateTime.getMinute() == 0) {

			dateTime = dateTime.withSecond(1);
			calendarDTO.setSchedule_end_date(dateTime);

		}

		int row = calendarDao.createSchedule(calendarDTO);
		map.put("success", row);
		return map;
	}

	public Map<String, Object> calendarDetail(int schedule_idx) {
			Map<String, Object> map = new HashMap<String, Object>();
			CalendarDTO dto = calendarDao.calendarDetail(schedule_idx);
			
			// 날짜 일자/시/분으로 나누는 메서드
			LocalDateTime startTime = dto.getSchedule_start_date();
			LocalDateTime endTime = dto.getSchedule_end_date();
			Map<String, Object> getStartTime= divideDateTime(startTime);
			Map<String, Object> getEndTime= divideDateTime(endTime);
		return null;
	}
	
	public Map<String, Object> divideDateTime(LocalDateTime date) {
		Map<String, Object>map = new HashMap<String, Object>();
		if(date != null) {
			date.getYear();
			
			map.put("getHout", date.getHour());
			map.put("getMin", date.getMinute());
			
		}
		
		return null;
	}

}
