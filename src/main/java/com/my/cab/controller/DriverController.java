package com.my.cab.controller;


import com.my.cab.dto.DriverDTO;
import com.my.cab.service.DriverService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Driver;
import java.util.Map;

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

	@PostMapping("/create.ajax")
	@ResponseBody
	public Map<String, Object> create(DriverDTO driverDTO, @RequestParam Map<String, MultipartFile> files) {
		logger.info("Create driverName : {}", driverDTO.getDriver_name());
		logger.info("Create files : {}", files);

		return null;
	}


}
