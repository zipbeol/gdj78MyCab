package com.my.cab.controller;

import com.my.cab.dto.ChatDTO;
import com.my.cab.dto.ChatRoomDTO;
import com.my.cab.service.ChatService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/chat")
public class ChatController {

    Logger logger = LoggerFactory.getLogger(getClass());

    private final ChatService chatService;

    public ChatController(ChatService chatService) {
        this.chatService = chatService;
    }

    @RequestMapping("/chat.go")
    public String chatGo(Model model, HttpSession session) {
        List<ChatRoomDTO> list = chatService.getChatRoomList((String) session.getAttribute("loginId"));
        for (ChatRoomDTO chatRoomDTO : list) {
            chatRoomDTO.setEmpList(chatService.getChatRoomMembers(chatRoomDTO));
        }
        model.addAttribute("chatRoomList", list);
        return "chat/chat";
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
}
