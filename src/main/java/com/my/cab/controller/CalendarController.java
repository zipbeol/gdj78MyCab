package com.my.cab.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

}
