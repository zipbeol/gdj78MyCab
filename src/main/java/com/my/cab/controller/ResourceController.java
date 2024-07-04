package com.my.cab.controller;


import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.my.cab.service.ResourceService;

@Controller
public class ResourceController { 
	
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	private final ResourceService resourceService;
	
	public ResourceController(ResourceService resourceService) {
		this.resourceService = resourceService;
		
	}

	
	@RequestMapping(value = "resource/create.go")
	public String resourceWriteGo() {
		
		return "resource/resourceWrite";
	}
	
	@RequestMapping(value = "resource/resourceWrite.do")
	public String resourceWrite(@RequestParam("carPhoto")MultipartFile file , @RequestParam Map<String,Object> param, HttpSession session) {
		logger.info("사진 받아온거 : " +file);
		param.put("id", session.getAttribute("loginId"));
		logger.info("리소스 등록 : "+param.get("resourceName"));
		logger.info("리소스 등록 : "+param.get("carLicencePlate"));
		
		resourceService.resourceWrite(param,file);
		
		return "resource/resourceList";
	}
	
	@PostMapping(value = "resource/resourcePhoto")
	@ResponseBody
	public String resourcePhoto(@RequestParam("upload") MultipartFile file) {
			logger.info("file"+file);
		return null;
	}
}
