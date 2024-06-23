package com.my.cab.controller;


import com.my.cab.service.DriverService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.Driver;

@Controller
@RequestMapping("/driver")
public class DriverController {

	private final DriverService driverService;
	Logger logger = LoggerFactory.getLogger(getClass());

	public DriverController(DriverService driverService) {
		this.driverService = driverService;
	}

	@RequestMapping("/list.go")
	public String listGo(Model model) {
		model.addAttribute("driverFirstRegDate", driverService.getDriverFirstRegDate());
		return "driver/driverList";
	}


}
