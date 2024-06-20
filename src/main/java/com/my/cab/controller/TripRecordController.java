package com.my.cab.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/triprecord")
public class TripRecordController { 
	
	Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping("/list.go")
	public String triprecordGo(Model model) {
		return "triprecord/tripRecord";
	}
}
