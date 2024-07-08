package com.my.cab.dto;

import org.apache.ibatis.type.Alias;

import java.util.List;

@Alias("chatRoom")
public class ChatRoomDTO {
    private Integer roomIdx;
    private String roomName;
    private List<ChatDTO> chatMessages;
    private String roomMemberCount;
    private String roomLastMessage;
    private List<EmpDTO> empList;
    private String roomLastMessageDate;
    private Integer roomEmpIdx;
    private String chatMessageIdx;

    public String getChatMessageIdx() {
        return chatMessageIdx;
    }

    public void setChatMessageIdx(String chatMessageIdx) {
        this.chatMessageIdx = chatMessageIdx;
    }

    public Integer getRoomEmpIdx() {
        return roomEmpIdx;
    }

    public void setRoomEmpIdx(Integer roomEmpIdx) {
        this.roomEmpIdx = roomEmpIdx;
    }

    public String getRoomLastMessageDate() {
        return roomLastMessageDate;
    }

    public void setRoomLastMessageDate(String roomLastMessageDate) {
        this.roomLastMessageDate = roomLastMessageDate;
    }

    public List<EmpDTO> getEmpList() {
        return empList;
    }

    public void setEmpList(List<EmpDTO> empList) {
        this.empList = empList;
    }

    public String getRoomMemberCount() {
        return roomMemberCount;
    }

    public void setRoomMemberCount(String roomMemberCount) {
        this.roomMemberCount = roomMemberCount;
    }

    public String getRoomLastMessage() {
        return roomLastMessage;
    }

    public void setRoomLastMessage(String roomLastMessage) {
        this.roomLastMessage = roomLastMessage;
    }

    public Integer getRoomIdx() {
        return roomIdx;
    }

    public void setRoomIdx(Integer roomIdx) {
        this.roomIdx = roomIdx;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public List<ChatDTO> getChatMessages() {
        return chatMessages;
    }

    public void setChatMessages(List<ChatDTO> chatMessages) {
        this.chatMessages = chatMessages;
    }
}
