package com.my.cab.controller;

import com.my.cab.service.ChatService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/chat")
public class ChatController {

    @Autowired
    ChatService chatService;
    Logger logger = LoggerFactory.getLogger(getClass());

    @RequestMapping("/chat.go")
    public String chatGo(Model model, HttpSession session) {
        model.addAttribute("chatRoomList", chatService.getChatRoomList((String) session.getAttribute("loginId")));
        return "chat/chat";
    }

    @RequestMapping("/admin/list.go")
    public String listGo() {
        return "chat/chatLog";
    }
}
