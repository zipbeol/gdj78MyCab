package com.my.cab.dao;

import com.my.cab.dto.AttachmentDTO;
import com.my.cab.dto.ChatDTO;
import com.my.cab.dto.ChatRoomDTO;
import com.my.cab.dto.EmpDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ChatDAO {

    void insertChatDB(ChatDTO chatDTO);

    void updateChatRoomDB(ChatDTO chatDTO);

    List<ChatRoomDTO> getChatRoomList(String loginId);

    List<ChatDTO> getMessages(String roomId);

    void insertChatAttachment(AttachmentDTO attachmentDTO);

    List<EmpDTO> getChatRoomMembers(ChatRoomDTO chatRoomDTO);

    String getSendDate(ChatDTO chatDTO);

    List<AttachmentDTO> getChatAttachment(ChatDTO chatDTO);

    boolean exitChatRoom(ChatRoomDTO chatRoomDTO);

    boolean deleteMessage(ChatDTO chatDTO);

    boolean createChatRoom(ChatRoomDTO chatRoomDTO);

    boolean joinMember(ChatRoomDTO chatRoomDTO);

    boolean updateChatRoomName(ChatRoomDTO chatRoomDTO);
}
