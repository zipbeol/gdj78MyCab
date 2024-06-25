package com.my.cab.controller;


import com.my.cab.service.TaxiSimulatorService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/taxiSimulator")
public class TaxiSimulatorController {
	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	TaxiSimulatorService taxiSimulatorService;

	@RequestMapping("/taxiSimulator.go")
	public String taxiSimulator(Model model) {
		return "simulator/taxiSimulator";
	}

}
