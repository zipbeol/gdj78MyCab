package com.my.cab.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/chat")
public class ChatController { 
	
	Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping("/chat.go")
	public String chatGo() {
		return "chat/chat";
	}
	@RequestMapping("/admin/list.go")
	public String listGo() {
		return "chat/chatLog";
	}
}
