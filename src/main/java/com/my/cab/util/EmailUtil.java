package com.my.cab.util;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;



@Component
public class EmailUtil {
	
	@Autowired JavaMailSender sender;
	
	public void sendSal(String email, String filePath, String currMonth, String empName) {
		MimeMessage message = this.sender.createMimeMessage();
		
	      
	      try {
	    	  MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	    	  
	    	  messageHelper.setTo(email);
	    	  messageHelper.setSubject(empName+"님의 "+currMonth);
	    	  messageHelper.setText("급여명세서가 작성되었습니다. 첨부파일을 확인해주세요. 문제가 있을시에는 인사부로 문의 부탁드립니다. 070-1234-1234");
	    	  messageHelper.addAttachment("급여명세서.pdf", new File(filePath));
			sender.send(message);
		} catch (MessagingException e) {
			
			e.printStackTrace();
		}
	    
		
		
	}
	
	

}
