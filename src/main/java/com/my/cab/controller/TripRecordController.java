package com.my.cab.controller;

import com.my.cab.dto.SearchDTO;
import com.my.cab.dto.TripRecordDTO;
import com.my.cab.service.TripRecordService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.Objects;


@Controller
@RequestMapping("/triprecord")
public class TripRecordController {

    Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    TripRecordService tripRecordService;

    @RequestMapping("/list.go")
    public String triprecordGo(Model model) {
        model.addAttribute("tripFirstDate", tripRecordService.getFirstTripDate());
        return "triprecord/tripRecord";
    }

    @PostMapping("/insertTripRecord.ajax")
    @ResponseBody
    public Map<String, Object> insertTripRecord(
            @RequestBody TripRecordDTO tripRecordDTO
    ) {
        logger.info("\n::::::::::::::::::::::" +
                "\ntripRecordDTO driver_idx:" + tripRecordDTO.getTrip_record_driver_id() +
                "\ntripRecordDTO start_location:" + tripRecordDTO.getTrip_record_start_location() +
                "\ntripRecordDTO end_location:" + tripRecordDTO.getTrip_record_end_location() +
                "\ntripRecordDTO distance:" + tripRecordDTO.getTrip_record_distance() +
                "\ntripRecordDTO fare:" + tripRecordDTO.getTrip_record_fare() +
                "\n::::::::::::::::::::::"
        );
        return Map.of("result", tripRecordService.insertTripRecord(tripRecordDTO));
    }

    @GetMapping("/list.ajax")
    @ResponseBody
    public Map<String, Object> listTripRecord(SearchDTO searchDTO) {
        return tripRecordService.listTripRecord(searchDTO);
    }
    @GetMapping("/getTotalPages.ajax")
    @ResponseBody
    public Map<String, Object> totalPageTripRecord(SearchDTO searchDTO) {
        return tripRecordService.totalPageTripRecord(searchDTO);
    }

}
