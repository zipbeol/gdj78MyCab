package com.my.cab.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mail")
public class MailController {
	
	Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping("/write.go")
	public String writeGo(){
		return "mail/mail";
	}
	@RequestMapping("/admin/list.go")
	public String listGo(){
		return "mail/mailLog";
	}
}
