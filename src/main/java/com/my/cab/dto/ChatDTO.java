package com.my.cab.dto;

import org.apache.ibatis.type.Alias;

import java.util.List;
import java.util.Set;

@Alias("chat")
public class ChatDTO {
    private Integer chatId;
    private String type;
    private String message;
    private String sender;
    private String date;
    private Integer empNo;
    private Integer room;
    private List<AttachmentDTO> attachments;
    private boolean messageIsDelete;
    private Set<Integer> roomIdxList;

    public Set<Integer> getRoomIdxList() {
        return roomIdxList;
    }

    public void setRoomIdxList(Set<Integer> roomIdxList) {
        this.roomIdxList = roomIdxList;
    }

    public boolean isMessageIsDelete() {
        return messageIsDelete;
    }

    public void setMessageIsDelete(boolean messageIsDelete) {
        this.messageIsDelete = messageIsDelete;
    }

    public Integer getChatId() {
        return chatId;
    }

    public void setChatId(Integer chatId) {
        this.chatId = chatId;
    }

    public Integer getRoom() {
        return room;
    }

    public void setRoom(Integer room) {
        this.room = room;
    }

    public List<AttachmentDTO> getAttachments() {
        return attachments;
    }

    public void setAttachments(List<AttachmentDTO> attachments) {
        this.attachments = attachments;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Integer getEmpNo() {
        return empNo;
    }

    public void setEmpNo(Integer empNo) {
        this.empNo = empNo;
    }
}
