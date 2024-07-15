package com.my.cab.handler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@Component
public class ChatRoomHandler extends TextWebSocketHandler {

    private static final Logger logger = LoggerFactory.getLogger(ChatRoomHandler.class);
    private final Map<String, Set<WebSocketSession>> roomSessions = new HashMap<>();
    private final ObjectMapper objectMapper = new ObjectMapper();

    // 처음 접속시
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        logger.info("{} 연결", session.getId());
    }

    // 메세지 관련
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String payload = message.getPayload();
        logger.info("message: {}", payload);

        Map<String, Object> messageData = objectMapper.readValue(payload, Map.class);
        String messageType = (String) messageData.get("type");

        if ("joinRooms".equals(messageType)) {
            // 사용자가 소속된 방 번호들을 받음
            Set<Integer> roomIdxList = new HashSet<>((Set<Integer>) messageData.get("roomIdxList"));
            addSessionToRooms(session, roomIdxList);
        }
    }

    // 연결 종료
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        logger.info("{} 연결 종료", session.getId());
        removeSessionFromRooms(session);
    }

    private void addSessionToRooms(WebSocketSession session, Set<Integer> roomIdxList) {
        for (Integer roomIdx : roomIdxList) {
            roomSessions.computeIfAbsent(roomIdx.toString(), k -> new HashSet<>()).add(session);
            logger.info("Session {} added to room {}", session.getId(), roomIdx);
        }
    }

    private void removeSessionFromRooms(WebSocketSession session) {
        for (Set<WebSocketSession> sessions : roomSessions.values()) {
            if (sessions.remove(session)) {
                logger.info("Session {} removed from a room", session.getId());
            }
        }
    }
}
