package com.my.cab.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController { 
	
	
Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "/")
	public String main() {
		
		return "main/main";
	}
	
	

	
	@RequestMapping(value = "calendar/calendar.go")
	public String calendarGo() {
		
		logger.info("일정관리 메인페이지 진입");
		
		return "calendar/calendarList";
	}
	
	

}
