package com.my.cab.dao;

import com.my.cab.dto.ChatDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ChatDAO {

    boolean insertChatDB(ChatDTO chatDTO);

    boolean updateChatRoomDB(ChatDTO chatDTO);

    List<ChatDTO> getChatRoomList(String loginId);
}
