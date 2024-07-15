package com.my.cab.handler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.my.cab.dto.ChatDTO;
import com.my.cab.service.ChatService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.io.IOException;
import java.net.URI;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@Component
public class ChatHandler extends TextWebSocketHandler {

    private static final Logger logger = LoggerFactory.getLogger(ChatHandler.class);

    // 채팅방 ID별로 세션을 관리하기 위한 Map
    private final Map<String, Set<WebSocketSession>> roomSessions = new HashMap<>();
    private final ObjectMapper objectMapper = new ObjectMapper();
    private final ChatService chatService;

    public ChatHandler(ChatService chatService) {
        this.chatService = chatService;
    }

    // 처음 접속시
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws IOException {
        logger.info("Connection established: {}", session);
        String roomId = getRoomId(session);
        if (roomId != null) {
            roomSessions.computeIfAbsent(roomId, k -> new HashSet<>()).add(session);
            logger.info("Session {} connected (Room ID: {})", session.getId(), roomId);
        } else {
            logger.error("Unable to extract Room ID. Closing session: {}", session.getId());
            session.close(CloseStatus.BAD_DATA);
        }
    }

    // 메시지 관련
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) {
        String payload = message.getPayload();
        logger.info("Received message: {}", payload);

        try {
            ChatDTO chatMessage = objectMapper.readValue(payload, ChatDTO.class);

            if ("joinRooms".equals(chatMessage.getType())) {
                // 사용자가 소속된 방 번호들을 받음
                addSessionToRooms(session, chatMessage.getRoomIdxList());
            } else {
                chatService.insertChatDB(chatMessage);
                String roomId = getRoomId(session);
                if (roomId != null && roomSessions.containsKey(roomId)) {
                    for (WebSocketSession sess : roomSessions.get(roomId)) {
                        if (sess.isOpen()) {
                            String response = objectMapper.writeValueAsString(chatMessage);
                            logger.info("Sending message: {}", response);
                            sess.sendMessage(new TextMessage(response));
                        }
                    }
                }
            }
            logger.info("Current room sessions: {}", roomSessions);

        } catch (IOException e) {
            logger.error("Failed to process message", e);
        }
    }

    // 연결 종료
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
        String roomId = getRoomId(session);
        if (roomId != null && roomSessions.containsKey(roomId)) {
            roomSessions.get(roomId).remove(session);
            if (roomSessions.get(roomId).isEmpty()) {
                roomSessions.remove(roomId);
            }
        }
        logger.info("Session {} disconnected (Room ID: {})", session.getId(), roomId);
    }

    // 세션에서 채팅방 ID를 추출하는 메소드
    private String getRoomId(WebSocketSession session) {
        URI uri = session.getUri();
        if (uri == null) {
            return null;
        }
        String path = uri.getPath();
        String[] parts = path.split("/");
        if (parts.length >= 3 && "chat".equals(parts[1])) {
            return parts[2];
        }
        return null;
    }

    private void addSessionToRooms(WebSocketSession session, Set<Integer> roomIdxList) {
        for (Integer roomIdx : roomIdxList) {
            roomSessions.computeIfAbsent(roomIdx.toString(), k -> new HashSet<>()).add(session);
            logger.info("Session {} added to room {}", session.getId(), roomIdx);
        }
    }
}
