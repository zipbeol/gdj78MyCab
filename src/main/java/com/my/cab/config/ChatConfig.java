package com.my.cab.config;

import com.my.cab.handler.ChatHandler;
import com.my.cab.handler.ChatRoomHandler;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
public class ChatConfig implements WebSocketConfigurer {


    private final ChatHandler chatHandler;
    private final ChatRoomHandler chatRoomHandler;

    public ChatConfig(ChatHandler chatHandler, ChatRoomHandler chatRoomHandler) {
        this.chatHandler = chatHandler;
        this.chatRoomHandler = chatRoomHandler;
    }

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        // /chat/chatRoom/* 요청에 들어온 모든아이피(*) 를 허용
        registry.addHandler(chatHandler, "/chat/*").setAllowedOrigins("*");
        registry.addHandler(chatRoomHandler, "/chatRoom").setAllowedOrigins("*");
    }
}
