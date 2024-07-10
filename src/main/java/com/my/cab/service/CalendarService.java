package com.my.cab.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.my.cab.dao.CalendarDAO;
import com.my.cab.dto.CalendarDTO;
import com.my.cab.dto.EmpDTO;

@Service
public class CalendarService {

	Logger logger = LoggerFactory.getLogger(getClass());

	private final CalendarDAO calendarDao;

	public CalendarService(CalendarDAO calendarDao) {
		this.calendarDao = calendarDao;
	}

	public List<Map<String, Object>> calListCall(String schedule_editor) {
		List<Map<String, Object>> getCalList = calendarDao.calListCall(schedule_editor);

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
			map.put("dto", dto);
			map.put("divideStartDate", getStartTime.get("dD"));
			map.put("divideStartHour", getStartTime.get("dH"));
			map.put("divideStartMin", getStartTime.get("dM"));
			map.put("divideEndDate", getEndTime.get("dD"));
			map.put("divideEndHour", getEndTime.get("dH"));
			map.put("divideEndMin", getEndTime.get("dM"));
			
		return map;
	}
	
	public Map<String, Object> divideDateTime(LocalDateTime date) {
		Map<String, Object>map = new HashMap<String, Object>();
			logger.info("divideDateTime getDate"+date);
		if(date != null) {
			DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			String devideDate = format.format(date);
			logger.info("날짜" + devideDate);
//			format = DateTimeFormatter.ofPattern("kk");
//			String divideHour = format.format(date);
//			logger.info("시간"+divideHour);
//			format = DateTimeFormatter.ofPattern("mm");
//			String divideMin = format.format(date);
//			logger.info("분" +divideMin );
			int divideHour = date.getHour();
			int divideMin = date.getMinute();
			
			map.put("dD", devideDate);
			map.put("dH", divideHour);
			map.put("dM", divideMin);
			
		}
		
		return map;
	}

	public Map<String, Object> deleteSchedule(int schedule_idx) {
		int result = calendarDao.deleteSchedule(schedule_idx);
			Map<String, Object> map = new HashMap<String, Object>();
		if(result >0) {
			map.put("success", true);
		}else {
			map.put("success", false);
		}
		return map;
	}

	public Map<String, Object> editSchedule(CalendarDTO calendarDTO) {
		Map<String, Object>map = new HashMap<String, Object>();
		int row = calendarDao.editSchedule(calendarDTO);
		logger.info("수정 성공 여부 calendar : row : " + row);
		if(row >0) {
			map.put("success", true);
		}else {
			map.put("success", false);
		}
		return map;
	}

	public List<EmpDTO> getEmpInfo() {
		
		return calendarDao.getEmpInfo();
	}

	public List<String> getDeptInfo() {
		
		return calendarDao.getDeptInfo();
	}

	public Map<String, Object> createShareCalendar(Map<String, Object> shareCalInfo) {
		//값 꺼내오기
		Map<String, Object> map = new HashMap<String, Object>();
		String shareTitle = (String) shareCalInfo.get("shareTitle");
		int id = Integer.parseInt((String) shareCalInfo.get("loginId"));
		String shareColor = (String) shareCalInfo.get("shareColor");
		CalendarDTO dto = new CalendarDTO();
		// dto 에 값 저장
		dto.setCalendar_emp_no(id);
		dto.setCalendar_name(shareTitle);
		dto.setCalendar_category("일정공유");
		dto.setCalendar_color(shareColor);
		logger.info("gasdgdsagsadg"+id);
		// 캘린더 생성후 공유일정에 추가를위한 cal_idx 받아오기
		calendarDao.createShareCalendar(dto);
		int idx = dto.getCalendar_idx();
		logger.info("생성하고 만들어진 idx : "+ idx);
		List<Map<String, Object>> list = (List<Map<String, Object>>) shareCalInfo.get("empList");
		for (Map<String, Object> map1 : list) {

			logger.info("list 에서 꺼낸거"+map1.get("empNo"));
		}
		// 일정공유 테이블에 idx ,emp no 넣기
		int row = calendarDao.createSharedSchedule(idx,list);
		logger.info("일정공유 테이블에 값 넣었지롱" + row);
		if (row >0) {
			map.put("success", true);
		}else {
			map.put("success", true);
		}
		return map;
	}

	public List<CalendarDTO> getShareCalInfo(String loginId) {
		
		return calendarDao.getShareCalInfo(loginId);
	}

	public Map<String, Object> createShareSchedule(CalendarDTO calendarDTO) {
		Map<String, Object> map = new HashMap<String, Object>();
		LocalDateTime dateTime = calendarDTO.getSchedule_end_date();
		logger.info("create-datetime" + dateTime.getHour() + "//" + dateTime.getMinute() + "" + dateTime.getSecond());
		// 하루종일 일정 시간 수정
		if (dateTime.getHour() == 0 & dateTime.getMinute() == 0) {

			dateTime = dateTime.withSecond(1);
			calendarDTO.setSchedule_end_date(dateTime);

		}

		int row = calendarDao.createShareSchedule(calendarDTO);
		map.put("success", row);
		
		return map;
	}

	public List<Map<String, Object>> shareCalListCall(String schedule_editor) {
		List<Map<String, Object>> shareCalList = calendarDao.shareCalListCall(schedule_editor);
		return shareCalList;
	}


}
