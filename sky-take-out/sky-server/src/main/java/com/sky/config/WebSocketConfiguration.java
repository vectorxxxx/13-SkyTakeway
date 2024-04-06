package com.sky.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

/**
 * @author VectorX
 * @version V1.0
 * @description WebSocket配置类，用于注册WebSocket的Bean
 * @date 2024-04-06 19:05:44
 */
@Configuration
public class WebSocketConfiguration
{

    @Bean
    public ServerEndpointExporter serverEndpointExporter() {
        return new ServerEndpointExporter();
    }

}
