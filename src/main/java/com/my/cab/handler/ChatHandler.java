package com.my.cab.handler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.my.cab.dto.ChatDTO;
import com.my.cab.service.ChatService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@Component
public class ChatHandler extends TextWebSocketHandler {

    Logger logger = LoggerFactory.getLogger(getClass());

    private final Set<WebSocketSession> sessions = new HashSet<WebSocketSession>();

    private final Map<String, Set<WebSocketSession>> chatRooms = new HashMap<String, Set<WebSocketSession>>();

    private final ObjectMapper mapper = new ObjectMapper();

    @Autowired
    ChatService chatService;

    // 처음 접속시
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        logger.info("{} 연결", session.getId());
        sessions.add(session);
    }

    // 메세지 관련
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String msg = message.getPayload();
        ChatDTO chatDTO = mapper.readValue(msg, ChatDTO.class);
        logger.info("message: {}", chatDTO.getMessage());
        logger.info("type: {}", chatDTO.getType());
        logger.info("sender: {}", chatDTO.getSender());
        logger.info("room: {}", chatDTO.getRoom());

        switch (chatDTO.getType()) {
            case "message":
                boolean result = chatService.insertChatDB(chatDTO);
                logger.info("insertDB result: {}", result);
                sendMessageToRoom(chatDTO);
                break;
            case "text":
                sendMessageToRoom(chatDTO);
                break;
            case "join":
                joinRoom(session, chatDTO.getRoom());
                break;
        }
    }

    // 연결 종료
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        logger.info("{} 연결 종료", session.getId());
        sessions.remove(session);
        leaveRoom(session);
    }

    /**
     * 세션 종료시 방 나가기
     *
     * @param session
     */
    private void leaveRoom(WebSocketSession session) {
        for (Map.Entry<String, Set<WebSocketSession>> entry : chatRooms.entrySet()) {
            Set<WebSocketSession> roomSessions = entry.getValue();
            if (roomSessions.remove(session)) {
                logger.info("{} 채팅방 {}에서 제거", session.getId(), entry.getKey());
            }
        }
        logger.info("{} 모든 채팅방에서 제거", session.getId());
    }

    /**
     * 방 입장하는 메서드. 방 존재하는 확인후
     *
     * @param session 접속 session
     * @param room    접속할 방
     */
    private void joinRoom(WebSocketSession session, String room) {
        Set<WebSocketSession> roomSessions = chatRooms.computeIfAbsent(room, k -> new HashSet<WebSocketSession>());
        roomSessions.add(session);
        logger.info("{} 채팅방 {}에 참여", session.getId(), room);
    }

    private void sendMessageToRoom(ChatDTO chatDTO) throws Exception {
        Set<WebSocketSession> roomSessions = chatRooms.get(chatDTO.getRoom());
        String messageJson = mapper.writeValueAsString(chatDTO);
        if (roomSessions != null) {
            for (WebSocketSession s : roomSessions) {
                s.sendMessage(new TextMessage(messageJson));
            }
        }
    }
}
