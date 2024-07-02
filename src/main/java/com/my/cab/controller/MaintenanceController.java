package com.my.cab.controller;

import com.my.cab.dto.MaintenanceDTO;
import com.my.cab.dto.SearchDTO;
import com.my.cab.service.MaintenanceService;
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
@RequestMapping("/maintenance")
public class MaintenanceController {
    Logger logger = LoggerFactory.getLogger(MaintenanceController.class);

    @Autowired
    MaintenanceService maintenanceService;

    @GetMapping("/list.ajax")
    @ResponseBody
    public Map<String, Object> getMaintenanceList(SearchDTO searchDTO) {
        logger.info("SearchDTO: {}", searchDTO.getSearchIdx());
        return Map.of("maintenanceList", maintenanceService.getMaintenanaceList(searchDTO));
    }

    @GetMapping("/getTotalPages.ajax")
    @ResponseBody
    public Map<String, Object> getMaintenanceTotalPages(SearchDTO searchDTO) {
        return Map.of("totalPages", maintenanceService.getMaintenanceTotalPages(searchDTO));
    }

    @PostMapping("/create.ajax")
    @ResponseBody
    public Map<String, Object> createMaintenance(MaintenanceDTO maintenanceDTO) {
        logger.info("\n:::::::::::::::::::::::::::::::::::::::::::::::"
                + "\nmaintenanceDTO taxiIdx = " + maintenanceDTO.getMaintenance_history_taxi_idx()
                + "\nmaintenanceDTO date = " + maintenanceDTO.getMaintenance_history_date()
                + "\nmaintenanceDTO description = " + maintenanceDTO.getMaintenance_history_description()
                + "\nmaintenanceDTO cost = " + maintenanceDTO.getMaintenance_history_cost()
                + "\nmaintenanceDTO workshop = " + maintenanceDTO.getMaintenance_history_workshop_name()
        );

        return Map.of("result", maintenanceService.insertMaintenanceHistory(maintenanceDTO));
    }

    @GetMapping("/detail.ajax")
    @ResponseBody
    public Map<String, Object> getMaintenanceDetail(String maintenanceIdx) {
        return Map.of("info", maintenanceService.getMaintenanceDetail(maintenanceIdx));
    }

    @PostMapping("/update.ajax")
    @ResponseBody
    public  Map<String, Object> updateMaintenance(MaintenanceDTO maintenanceDTO) {
        return Map.of("result", maintenanceService.updateMaintenance(maintenanceDTO));
    }
}
