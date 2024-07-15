package com.my.cab.controller;

import com.my.cab.dto.MailDTO;
import com.my.cab.service.MailService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Map;

@RestController
@RequestMapping("/mail")
public class MailController {

    Logger logger = LoggerFactory.getLogger(getClass());

    private final MailService mailService;

    public MailController(MailService mailService) {
        this.mailService = mailService;
    }

    @Value("${spring.mail.username}")
    private String from;


    @RequestMapping("/write.go")
    public ModelAndView writeGo() {
        return new ModelAndView("mail/mail");
    }

    @RequestMapping("/admin/list.go")
    public ModelAndView listGo() {
        return new ModelAndView("mail/mailLog");
    }

    @PostMapping("/write.ajax")
    public Map<String, Object> writeAjax(MailDTO mailDTO, HttpSession session) {
        mailDTO.setFrom(from);
        mailDTO.setSender((String) session.getAttribute("loginId"));
        return Map.of("result", mailService.mailWriteAndDBInsert(mailDTO));
    }
}
