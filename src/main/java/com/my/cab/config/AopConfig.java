package com.my.cab.config;

import com.my.cab.aop.LoggingAop;
import com.my.cab.aop.TimeTraceAop;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AopConfig {

    // 시간 체크하는 aop
    @Bean
    public TimeTraceAop timeTraceAop() {
        return new TimeTraceAop();
    }

    // parameter 로깅 해주는 aop
    @Bean
    public LoggingAop loggingAop() {
        return new LoggingAop();
    }

}
