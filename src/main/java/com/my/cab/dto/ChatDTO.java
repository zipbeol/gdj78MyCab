package com.my.cab.dto;

import org.apache.ibatis.type.Alias;

@Alias("chat")
public class ChatDTO {
    private String room;
    private String type;
    private String message;
    private String sender;
    private String date;
    private String empNo;
    private String chatRoomIdx;
    private String userName;
    private String chatRoomName;
    private String chatRoomLastMessage;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getEmpNo() {
        return empNo;
    }

    public void setEmpNo(String empNo) {
        this.empNo = empNo;
    }

    public String getChatRoomIdx() {
        return chatRoomIdx;
    }

    public void setChatRoomIdx(String chatRoomIdx) {
        this.chatRoomIdx = chatRoomIdx;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getChatRoomName() {
        return chatRoomName;
    }

    public void setChatRoomName(String chatRoomName) {
        this.chatRoomName = chatRoomName;
    }

    public String getChatRoomLastMessage() {
        return chatRoomLastMessage;
    }

    public void setChatRoomLastMessage(String chatRoomLastMessage) {
        this.chatRoomLastMessage = chatRoomLastMessage;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
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
}
