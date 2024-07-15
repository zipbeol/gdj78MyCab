package com.my.cab.service;

import com.my.cab.dao.ChatDAO;
import com.my.cab.dto.AttachmentDTO;
import com.my.cab.dto.ChatDTO;
import com.my.cab.dto.ChatRoomDTO;
import com.my.cab.dto.EmpDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;


@Service
public class ChatService {

    @Value("${spring.servlet.multipart.location}")
    private String uploadDir;

    private final ChatDAO chatDAO;

    Logger logger = LoggerFactory.getLogger(getClass());

    public ChatService(ChatDAO chatDAO) {
        this.chatDAO = chatDAO;
    }

    public void insertChatDB(ChatDTO chatDTO) {
        chatDAO.insertChatDB(chatDTO);
        chatDTO.setDate(chatDAO.getSendDate(chatDTO));
        if (chatDTO.getType().equals("file")) {
            for (AttachmentDTO attachmentDTO : chatDTO.getAttachments()) {
                attachmentDTO.setChatIdx(chatDTO.getChatId());
                chatDAO.insertChatAttachment(attachmentDTO);
            }
        }
        chatDAO.updateChatRoomDB(chatDTO);
    }

    public List<ChatRoomDTO> getChatRoomList(String loginId) {
        return chatDAO.getChatRoomList(loginId);
    }

    public List<ChatDTO> getMessages(String roomId) {
        List<ChatDTO> list = chatDAO.getMessages(roomId);
        for (ChatDTO chatDTO : list) {
            if (chatDTO.getType().equals("file")) {
                chatDTO.setAttachments(chatDAO.getChatAttachment(chatDTO));

            }
        }
        return list;
    }

    public String uploadFile(MultipartFile file) {


        String uploadFileName = "chat_" + System.currentTimeMillis()
                + file.getOriginalFilename()
                .substring(file.getOriginalFilename().lastIndexOf("."));
        logger.info("Uploading file: " + uploadFileName);
        try {
            byte[] bytes = file.getBytes();
            Path path = Paths.get(uploadDir + "/" + uploadFileName);
            Files.write(path, bytes);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return uploadFileName;
    }

    public List<EmpDTO> getChatRoomMembers(ChatRoomDTO chatRoomDTO) {
        return chatDAO.getChatRoomMembers(chatRoomDTO);
    }

    @Transactional
    public boolean exitChatRoom(ChatRoomDTO chatRoomDTO) {
        return chatDAO.exitChatRoom(chatRoomDTO) && chatDAO.updateChatRoomName(chatRoomDTO);
    }

    public boolean deleteMessage(ChatDTO chatDTO) {
        return chatDAO.deleteMessage(chatDTO);
    }

    @Transactional
    public boolean createChatRoom(ChatRoomDTO chatRoomDTO) {
        boolean createChatRoom = chatDAO.createChatRoom(chatRoomDTO);
        return createChatRoom && insertChatRoomMembers(chatRoomDTO);
    }

    public boolean inviteMembers(ChatRoomDTO chatRoomDTO) {
        return insertChatRoomMembers(chatRoomDTO);
    }

    public boolean insertChatRoomMembers(ChatRoomDTO chatRoomDTO) {
        boolean result = true;
        for (EmpDTO dto : chatRoomDTO.getEmpList()) {
            chatRoomDTO.setRoomEmpIdx(dto.getEmp_no());
            if (!chatDAO.joinMember(chatRoomDTO)) {
                result = false;
            }
        }
        return result;
    }
}
