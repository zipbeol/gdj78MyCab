package com.my.cab.controller;


import com.my.cab.dto.DriverDTO;
import com.my.cab.dto.SearchDTO;
import com.my.cab.service.DriverService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Driver;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/driver")
public class DriverController {

    private final DriverService driverService;
    Logger logger = LoggerFactory.getLogger(getClass());

    public DriverController(DriverService driverService) {
        this.driverService = driverService;
    }

    @RequestMapping("/list.go")
    public String listGo(Model model) {
        model.addAttribute("driverFirstRegDate", driverService.getDriverFirstRegDate());
        return "driver/driverList";
    }

    @PostMapping("/create.ajax")
    @ResponseBody
    public Map<String, Object> create(DriverDTO driverDTO, @RequestParam Map<String, MultipartFile> files) {
        logger.info("Create driverName : {}", driverDTO.getDriver_name());
        logger.info("Create files : {}", files.size());

        boolean isSuccess = driverService.createDriver(driverDTO, files);

        return Map.of("isSuccess", isSuccess);
    }

    @GetMapping("/list.ajax")
    @ResponseBody
    public Map<String, Object> list(SearchDTO searchDTO) {
        logger.info("\nsearchDTO SearchText:" + searchDTO.getSearchText()
                + "\nsearchDTO filterIsRetired:" + searchDTO.getFilterIsRetired()
                + "\nsearchDTO filterStartDate:" + searchDTO.getFilterStartDate()
                + "\nsearchDTO filterEndDate:" + searchDTO.getFilterEndDate()
                + "\nsearchDTO page:" + searchDTO.getPage()
        );
        return driverService.getDriverList(searchDTO);
    }

    @GetMapping("/getTotalPages.ajax")
    @ResponseBody
    public Map<String, Object> getTotalPages(SearchDTO searchDTO) {
        return driverService.getDriverTotalPages(searchDTO);
    }

    @RequestMapping("/detail.go")
    public String detailGo(Model model, String driver_idx) {
        DriverDTO driverInfo = driverService.getDriverInfo(driver_idx);
        model.addAttribute("driverInfo", driverInfo);
        return "driver/driverInfo";
    }

    @PostMapping("update.ajax")
    @ResponseBody
    public Map<String, Object> update(DriverDTO driverDTO, @RequestParam Map<String, MultipartFile> files) {
        logger.info("\n::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
                + "\ndriverDTO idx:" + driverDTO.getDriver_idx()
                + "\ndriverDTO name:" + driverDTO.getDriver_name()
                + "\ndriverDTO isRetired:" + driverDTO.getDriver_is_retired()
                + "\ndriverDTO phone:" + driverDTO.getDriver_phone()
                + "\ndriverDTO Address:" + driverDTO.getDriver_address()
                + "\ndriverDTO AddressDetail:" + driverDTO.getDriver_address_detail()
                + "\nfile fileCount:" + files.size()
                + "\n::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
        );


        return Map.of("result", driverService.updateDriverInfoAndUploadFiles(driverDTO,files));
    }

}
