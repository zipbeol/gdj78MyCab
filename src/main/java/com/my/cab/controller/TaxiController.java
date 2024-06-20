package com.my.cab.controller;


import com.my.cab.service.TaxiService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/taxi")
public class TaxiController {

    Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    TaxiService taxiService;

    @RequestMapping("/list.go")
    public String listGo(Model model) {
        return "taxi/taxiList";
    }

}
