package com.my.cab.service;

import com.my.cab.dao.MailDAO;
import com.my.cab.dto.MailDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;


@Service
public class MailService {

    Logger logger = LoggerFactory.getLogger(getClass());

    private final MailDAO mailDAO;
    private final JavaMailSender mailSender;


    public MailService(MailDAO mailDAO, JavaMailSender mailSender) {
        this.mailDAO = mailDAO;
        this.mailSender = mailSender;
    }



    public boolean mailWriteAndDBInsert(MailDTO mailDTO) {
        mailSend(mailDTO);
        return mailDAO.mailDBInsert(mailDTO);
    }

    private void mailSend(MailDTO mailDTO) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(mailDTO.getRecipient());
        message.setSubject(mailDTO.getSubject());
        message.setText(mailDTO.getBody());
        message.setFrom(mailDTO.getFrom());
        mailSender.send(message);
    }
}
