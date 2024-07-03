package com.my.cab.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ResourceController { 
	
	
	Logger logger = LoggerFactory.getLogger(getClass());

	
	@RequestMapping(value = "resource/create.go")
	public String resourceWriteGo() {
		
		return "resource/resourceWrite";
	}
}
