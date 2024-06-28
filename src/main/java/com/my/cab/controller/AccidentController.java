package com.my.cab.controller;

import com.my.cab.dto.SearchDTO;
import com.my.cab.service.AccidentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@RequestMapping("/accident")
public class AccidentController {
    Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    AccidentService accidentService;

    @GetMapping("/list.ajax")
    @ResponseBody
    public Map<String, Object> getAccidentList(SearchDTO searchDTO) {
        logger.info("SearchDTO: {}", searchDTO.getSearchIdx());
        return Map.of("maintenanceList", accidentService.getAccidentList(searchDTO));
    }
    @GetMapping("/getTotalPages.ajax")
    @ResponseBody
    public Map<String, Object> getAccidentTotalPages(SearchDTO searchDTO) {
        return Map.of("totalPages", accidentService.getAccidentTotalPages(searchDTO));
    }

}
