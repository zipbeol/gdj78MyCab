package com.my.cab.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.cab.dto.CalendarDTO;
import com.my.cab.service.CalendarService;


@Controller
public class CalendarController {
	
	private final CalendarService calendarService;
	
	public CalendarController (CalendarService calendarService) {
		this.calendarService = calendarService;
		
	};
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@GetMapping(value = "calendar/listCall.ajax")
	@ResponseBody
	public List<Map<String, Object>>calListCall(){
		
		logger.info("캘린더 리스트 불러오기 컨트롤러 도착");
		
		return calendarService.calListCall();
	}
	
	/*
	 * @RequestMapping(value = "calendar/dayCalListCall.ajax")
	 * 
	 * @ResponseBody public List<Map<String, Object>>dayCalListCall(String
	 * selectedDay){ logger.info("일자 선택 : "+selectedDay);
	 * 
	 * return calendarService.dayCalListCall(selectedDay); }
	 */
	
	@RequestMapping(value = "calendar/createSchedule.ajax")
	@ResponseBody
	public Map<String, Object> createSchedule(CalendarDTO calendarDTO){
		
		logger.info(calendarDTO.getSchedule_category());
		logger.info("s"+calendarDTO.getSchedule_start_date());
		
		return calendarService.createSchedule(calendarDTO);
	}
	
	@RequestMapping(value = "calendar/calendarDetail.ajax")
	@ResponseBody
	public Map<String, Object> calendarDetail(int schedule_idx){
		logger.info("캘린더 디테일"+schedule_idx);
		
		return calendarService.calendarDetail(schedule_idx);
	}
	
	@RequestMapping(value = "calendar/deleteSchedule.ajax")
	@ResponseBody
	public Map<String, Object>deleteSchedule(int schedule_idx){
			
		return calendarService.deleteSchedule(schedule_idx);
	}
	
	@RequestMapping(value = "calendar/editSchedule.ajax")
	@ResponseBody
	public Map<String, Object>editSchedule(CalendarDTO calendarDTO){
		logger.info("컨트롤러에서 받은 값 : " + calendarDTO.getSchedule_content());
		
		
		return calendarService.editSchedule(calendarDTO);
	}
	
	
}
