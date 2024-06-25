package com.my.cab.service;

import com.my.cab.dao.DriverDAO;
import com.my.cab.dto.DriverDTO;
import com.my.cab.dto.SearchDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class DriverService {

    Logger logger = LoggerFactory.getLogger(getClass());

    @Value("${spring.servlet.multipart.location}")
    private String uploadDir;

    private static final int PAGE_SIZE = 10;

    private final DriverDAO driverDAO;

    @Autowired
    public DriverService(DriverDAO driverDAO) {
        this.driverDAO = driverDAO;
    }

    /**
     * 택시기사 가장 오래된 등록일 가져오는 메서드
     *
     * @return {@code String}
     */
    public String getDriverFirstRegDate() {
        return driverDAO.getDriverFirstRegDate();
    }


    @Transactional
    public boolean createDriver(DriverDTO driverDTO, Map<String, MultipartFile> files) {
        boolean result = false;
        result = insertDriverInfo(driverDTO);
        for (Map.Entry<String, MultipartFile> file : files.entrySet()) {
            Map<String, Object> map = fileUpload(file, driverDTO.getDriver_idx(), result);
            String newFileName = (String) map.get("newFileName");
            result = (boolean) map.get("result");

            if (file.getKey().equals("driver_photo_file")) {
                driverDTO.setDriver_photo(newFileName);
                result = updateDriverPhoto(driverDTO);
            } else {
                driverDTO.setDriver_taxi_license_photo(newFileName);
                result = updateDriverTaxiLicensePhoto(driverDTO);
            }
        }
        return result;
    }

    private boolean updateDriverTaxiLicensePhoto(DriverDTO driverDTO) {

        return driverDAO.updateDriverTaxiLicensePhoto(driverDTO);
    }

    private boolean updateDriverPhoto(DriverDTO driverDTO) {

        return driverDAO.updateDriverPhoto(driverDTO);
    }

    private Map<String, Object> fileUpload(Map.Entry<String, MultipartFile> file, int driverIdx, boolean result) {
        /////////////////// 나중에 수정해야함///////////////////
        uploadDir = "src/main/resources/static/upload";
        ////////////////////////////////////////////////////

        String uploadFileName = file.getKey() + "_" + driverIdx
                + file.getValue()
                .getOriginalFilename()
                .substring(file.getValue()
                        .getOriginalFilename()
                        .lastIndexOf("."));
        logger.info("Uploading file: " + uploadFileName);

        try {
            byte[] bytes = file.getValue().getBytes();
            Path path = Paths.get(uploadDir + "/" + uploadFileName);
            Files.write(path, bytes);
        } catch (Exception e) {
            result = false;
            e.printStackTrace();
        }
        result = true;
        return Map.of("newFileName", uploadFileName, "result", result);
    }

    private boolean insertDriverInfo(DriverDTO driverDTO) {

        return driverDAO.insertDriverInfo(driverDTO);
    }

    public Map<String, Object> getDriverList(SearchDTO searchDTO) {
        Map<String, Object> result = new HashMap<String,Object>();
        int page = (searchDTO.getPage() - 1) * PAGE_SIZE;
        searchDTO.setPage(page);
        searchDTO.setPageSize(PAGE_SIZE);
        logger.info("page {}", page);
        logger.info("searchDTO page {}", searchDTO.getPage());
        List<DriverDTO> driverList = driverDAO.getDriverList(searchDTO);
        logger.info("driverList {}", driverList);
        result.put("driverList", driverList);
        return result;
    }

    public Map<String, Object> getDriverTotalPages(SearchDTO searchDTO) {
        int driverTotal = driverDAO.getDriverTotal(searchDTO);
        int totalPages = (int) Math.ceil((double) driverTotal / PAGE_SIZE);
        totalPages = totalPages > 0 ? totalPages : 1;
        return Map.of("totalPages", totalPages);
    }

    public DriverDTO getDriverInfo(String driverIdx) {
        return driverDAO.getDriverInfo(driverIdx);
    }

    private void deleteFile(String file) {
        logger.info("delete file {}", file);
        File delFile = new File("/upload/" + "/" + file);
        if (delFile.exists()) {
            delFile.delete();
        }
    }

    public boolean updateDriverInfoAndUploadFiles(DriverDTO driverDTO, Map<String, MultipartFile> files) {
        boolean result = false;
        result = driverDAO.updateDriverInfo(driverDTO);

        for (Map.Entry<String, MultipartFile> file : files.entrySet()) {
            Map<String, Object> map = fileUpload(file, driverDTO.getDriver_idx(), result);
            logger.info("upload file {}", file.getValue().getOriginalFilename());
            logger.info("upload newFileName {}", map.get("newFileName"));
            logger.info("upload column {}", file.getKey());
            String newFileName = (String) map.get("newFileName");
            result = (boolean) map.get("result");

            if (file.getKey().equals("driver_photo_file")) {
                logger.info("driver_photo_file_file");
                driverDTO.setDriver_photo(newFileName);
                result = updateDriverPhoto(driverDTO);
            } else {
                logger.info("driver_taxi_license_photo_file");
                driverDTO.setDriver_taxi_license_photo(newFileName);
                result = updateDriverTaxiLicensePhoto(driverDTO);
            }
        }

        return result;
    }
}
