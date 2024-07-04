package com.my.cab.service;

import com.my.cab.dao.ChatDAO;
import com.my.cab.dto.ChatDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ChatService {

	@Autowired
	ChatDAO chatDAO;
	Logger logger = LoggerFactory.getLogger(getClass());

	public boolean insertChatDB(ChatDTO chatDTO){
		boolean result = false;
		result =  chatDAO.insertChatDB(chatDTO);
		result = chatDAO.updateChatRoomDB(chatDTO);
		return result;
	}

	public List<ChatDTO> getChatRoomList(String loginId) {
		return chatDAO.getChatRoomList(loginId);
	}
}
