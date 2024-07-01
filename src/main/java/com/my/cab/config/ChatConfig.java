package com.my.cab.config;

import com.my.cab.handler.ChatHandler;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
public class ChatConfig implements WebSocketConfigurer {


    private final ChatHandler chatHandler;

    public ChatConfig(ChatHandler chatHandler) {
        this.chatHandler = chatHandler;
    }

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        System.out.println("WebSocket config registry = " + registry);
        // /chat/chatRoom/* 요청에 들어온 모든아이피(*) 를 허용
        registry.addHandler(chatHandler, "/chat/*").setAllowedOrigins("*");
    }
}
