package com.my.cab.controller;

import com.my.cab.dto.ChatDTO;
import com.my.cab.dto.ChatRoomDTO;
import com.my.cab.service.ChatService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/chat")
public class ChatController {

    private final ServletConfig servletConfig;
    Logger logger = LoggerFactory.getLogger(getClass());

    private final ChatService chatService;

    @Value("${spring.servlet.multipart.location}")
    private String uploadDir;

    public ChatController(ChatService chatService, ServletConfig servletConfig) {
        this.chatService = chatService;
        this.servletConfig = servletConfig;
    }

    @RequestMapping("/chat.go")
    public String chatGo(Model model, HttpSession session) {
        List<ChatRoomDTO> list = chatService.getChatRoomList((String) session.getAttribute("loginId"));
        for (ChatRoomDTO chatRoomDTO : list) {
            chatRoomDTO.setEmpList(chatService.getChatRoomMembers(chatRoomDTO));
        }
        model.addAttribute("chatRoomList", list);
        model.addAttribute("uploadDir", uploadDir);
        return "chat/chat";
    }

    @RequestMapping("/getChatRoomList.ajax")
    @ResponseBody
    public Map<String, Object> chatGo(String emp_no) {
        List<ChatRoomDTO> list = chatService.getChatRoomList(emp_no);
        for (ChatRoomDTO chatRoomDTO : list) {
            chatRoomDTO.setEmpList(chatService.getChatRoomMembers(chatRoomDTO));
        }
        return Map.of("list", list);
    }

    @RequestMapping("/admin/list.go")
    public String listGo() {
        return "chat/chatLog";
    }

    @GetMapping("/messages.ajax")
    @ResponseBody
    public Map<String, Object> getMessages(String roomId) {
        return Map.of("messages", chatService.getMessages(roomId));
    }

    @PostMapping("/uploadAttachment.ajax")
    @ResponseBody
    public Map<String, Object> uploadAttachment(MultipartFile file) {
        return Map.of("fileName", chatService.uploadFile(file));
    }

    @PostMapping("/exitChatRoom.ajax")
    @ResponseBody
    public Map<String, Object> exitChatRoom(ChatRoomDTO chatRoomDTO) {
        return Map.of("result", chatService.exitChatRoom(chatRoomDTO));
    }

    @GetMapping("/deleteMessage.ajax")
    @ResponseBody
    public Map<String, Object> deleteMessage(ChatDTO chatDTO) {
        return Map.of("result", chatService.deleteMessage(chatDTO));
    }

    @PostMapping("/createChatRoom.ajax")
    @ResponseBody
    public Map<String, Object> createChatRoom(@RequestBody ChatRoomDTO chatRoomDTO) {
        logger.info("chatRoomDTO: {}", chatRoomDTO.getRoomName());
        logger.info("chatRoomDTO: {}", chatRoomDTO.getRoomEmpIdx());
        return Map.of("result", chatService.createChatRoom(chatRoomDTO));
    }

    @PostMapping("/inviteMembers.ajax")
    @ResponseBody
    public Map<String, Object> inviteMembers(ChatRoomDTO chatRoomDTO) {
        return Map.of("result", chatService.inviteMembers(chatRoomDTO));
    }

}
