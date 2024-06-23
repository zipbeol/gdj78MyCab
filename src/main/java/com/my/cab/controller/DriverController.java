package com.my.cab.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/driver")
public class DriverController { 
	
	Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping("/list.go")
	public String listGo(Model model) {
		return "driver/driverList";
	}


}
