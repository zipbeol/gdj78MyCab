package com.my.cab.controller;

import com.my.cab.dto.AccidentDTO;
import com.my.cab.dto.SearchDTO;
import com.my.cab.service.AccidentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
//        logger.info("SearchDTO 'searchIdx': {}", searchDTO.getSearchIdx());
//        logger.info("SearchDTO 'searchText': {}", searchDTO.getSearchText());
//        logger.info("SearchDTO 'category': {}", searchDTO.getCategory());
//        logger.info("SearchDTO 'filterStartDate': {}", searchDTO.getFilterStartDate());
//        logger.info("SearchDTO 'filterEndDate' : {}", searchDTO.getFilterEndDate());
//        logger.info("SearchDTO 'page' : {}", searchDTO.getPage());
//        logger.info("SearchDTO 'sortColumn' : {}", searchDTO.getSortColumn());
//        logger.info("SearchDTO 'sortOrder' : {}", searchDTO.getSortOrder());

        return Map.of("accidentList", accidentService.getAccidentList(searchDTO));
    }

    @GetMapping("/getTotalPages.ajax")
    @ResponseBody
    public Map<String, Object> getAccidentTotalPages(SearchDTO searchDTO) {
//        logger.info("taxiIdx: {}", searchDTO.getSearchIdx());
        logger.info("startDate: {}", searchDTO.getFilterStartDate());
        logger.info("endDate: {}", searchDTO.getFilterEndDate());
//        logger.info("category: {}", searchDTO.getCategory());
//        logger.info("searchText: {}", searchDTO.getSearchText());

        return Map.of("totalPages", accidentService.getAccidentTotalPages(searchDTO));
    }

    @PostMapping("/create.ajax")
    @ResponseBody
    public Map<String, Object> createAccidentHistory(AccidentDTO accidentDTO) {

        return accidentService.createAccidentHistory(accidentDTO);
    }

    @GetMapping("/detail.ajax")
    @ResponseBody
    public Map<String, Object> getAccidentDetail(String accidentIdx) {
        return Map.of("info", accidentService.getAccidentDetail(accidentIdx));
    }
}
