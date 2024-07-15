package com.my.cab.config;


import java.util.Properties;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {
	
	private static final String MAIL_SMTP_AUTH = "mail.smtp.auth";
	private static final String MAIL_SMTP_STARTTLS_ENABLE = "mail.smtp.starttls.enable";
	
	 	@Value("${spring.mail.host}")
	    private String host;

	    @Value("${spring.mail.username}")
	    private String username;

	    @Value("${spring.mail.password}")
	    private String password;

	    @Value("${spring.mail.port}")
	    private int port;

	    @Value("${spring.mail.properties.mail.smtp.auth}")
	    private boolean auth;

	    @Value("${spring.mail.properties.mail.smtp.starttls.enable}")
	    private boolean startTlsEnable;

	    @Bean
	    public JavaMailSender javaMailService() {
	        JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
	        javaMailSender.setHost(host);
	        javaMailSender.setUsername(username);
	        javaMailSender.setPassword(password);
	        javaMailSender.setPort(port);

	        Properties properties = javaMailSender.getJavaMailProperties();
	        properties.put(MAIL_SMTP_AUTH, auth);
	        properties.put(MAIL_SMTP_STARTTLS_ENABLE, startTlsEnable);
	        properties.put("mail.smtp.ssl.protocols", "TLSv1.2"); // 추가된 부분

	        javaMailSender.setJavaMailProperties(properties);
	        javaMailSender.setDefaultEncoding("UTF-8");

	        return javaMailSender;
	    }

}
