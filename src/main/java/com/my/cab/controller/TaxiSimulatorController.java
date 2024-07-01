package com.my.cab.controller;


import com.my.cab.dto.SearchDTO;
import com.my.cab.service.DriverService;
import com.my.cab.service.TaxiSimulatorService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;


@Controller
@RequestMapping("/taxiSimulator")
public class TaxiSimulatorController {
    Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    TaxiSimulatorService taxiSimulatorService;
    @Autowired
    private DriverService driverService;

    @RequestMapping("/taxiSimulator.go")
    public String taxiSimulator(Model model) {
        model.addAttribute("drivers", driverService.getNotRetiredDriverList());
        return "simulator/taxiSimulator";
    }

    @GetMapping("/list.ajax")
    @ResponseBody
    public Map<String, Object> list(SearchDTO searchDTO) {
        return Map.of("drivers", driverService.getNotRetiredDriverList(searchDTO));
    }
}
