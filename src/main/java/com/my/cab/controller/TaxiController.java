package com.my.cab.controller;


import com.my.cab.dto.SearchDTO;
import com.my.cab.dto.TaxiDTO;
import com.my.cab.service.TaxiService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;


@Controller
@RequestMapping("/taxi")
public class TaxiController {

    Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    TaxiService taxiService;

    @RequestMapping("/list.go")
    public String listGo(Model model) {
        logger.info("listGo 호출");
        model.addAttribute("taxiModelList",taxiService.getTaxiModelList());
        model.addAttribute("taxiList",taxiService.getTaxiList());
        return "taxi/taxiList";
    }

    @GetMapping("/list.ajax")
    @ResponseBody
    public Map<String, Object> listAjax(SearchDTO searchDTO) {
        logger.info("listAjax 호출");
        logger.info("searchDTO SearchText:{}", searchDTO.getSearchText());
        return taxiService.listAjax(searchDTO);
    }

    @PostMapping("/create.ajax")
    @ResponseBody
    public Map<String , Object> registerTaxi(TaxiDTO taxiDTO){
        logger.info("param taxi_license_plate:{}", taxiDTO.getTaxi_license_plate());
        logger.info("param taxi_model:{}", taxiDTO.getTaxi_model());
        logger.info("param taxi_fuel_type:{}", taxiDTO.getTaxi_fuel_type());

        return taxiService.registerTaxi(taxiDTO);
    }
}
