package com.my.cab.service;

import com.my.cab.dao.DriverDAO;
import com.my.cab.dto.DriverDTO;
import com.my.cab.dto.SearchDTO;
import com.my.cab.util.PageCalc;
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


    /**
     * 기사 생성하는 메서드
     *
     * @param driverDTO
     * @param files
     * @return
     */
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

    /**
     * 기사 면허사진 업데이트
     *
     * @param driverDTO
     * @return
     */
    private boolean updateDriverTaxiLicensePhoto(DriverDTO driverDTO) {

        return driverDAO.updateDriverTaxiLicensePhoto(driverDTO);
    }

    /**
     * 기사 사진이름 디비에서 업데이트
     *
     * @param driverDTO
     * @return
     */
    private boolean updateDriverPhoto(DriverDTO driverDTO) {

        return driverDAO.updateDriverPhoto(driverDTO);
    }

    /**
     * 기사 사진 파일 업로드
     *
     * @param file
     * @param driverIdx
     * @param result
     * @return
     */
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

    /**
     * 기사 추가
     *
     * @param driverDTO
     * @return
     */
    private boolean insertDriverInfo(DriverDTO driverDTO) {
        return driverDAO.insertDriverInfo(driverDTO);
    }

    /**
     * 기사 리스트 리턴하는 메서드
     *
     * @param searchDTO
     * @return
     */
    public Map<String, Object> getDriverList(SearchDTO searchDTO) {
        Map<String, Object> result = new HashMap<String, Object>();
        int page = PageCalc.calculatePageOffset(searchDTO.getPage(), PAGE_SIZE);
        searchDTO.setPage(page);
        searchDTO.setPageSize(PAGE_SIZE);
        logger.info("page {}", page);
        logger.info("searchDTO page {}", searchDTO.getPage());
        List<DriverDTO> driverList = driverDAO.getDriverList(searchDTO);
        logger.info("driverList {}", driverList);
        result.put("driverList", driverList);
        return result;
    }

    /**
     * 기사 총 페이지수 리턴하는 메서드
     *
     * @param searchDTO
     * @return
     */
    public Map<String, Object> getDriverTotalPages(SearchDTO searchDTO) {
        int driverTotal = driverDAO.getDriverTotal(searchDTO);
        return Map.of("totalPages", PageCalc.calculateTotalPages(driverTotal, PAGE_SIZE));
    }

    public DriverDTO getDriverInfo(String driverIdx) {
        return driverDAO.getDriverInfo(driverIdx);
    }

    /**
     * 파일 이름 넣으면 /upload/파일이름 삭제
     *
     * @param file
     */
    private void deleteFile(String file) {
        logger.info("delete file {}", file);
        File delFile = new File("/upload/" + "/" + file);
        if (delFile.exists()) {
            delFile.delete();
        }
    }

    /**
     * 기사 정보 업데이트하고 사진있다면 업로드후 디비 업데이트
     *
     * @param driverDTO
     * @param files
     * @return
     */
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

    /**
     * 재직중인 택시기사 리스트 리턴
     *
     * @return
     */
    public List<DriverDTO> getNotRetiredDriverList() {
        return driverDAO.getNotRetiredDriverList();
    }
    /**
     * 검색된 재직중인 택시기사 리스트 리턴
     *
     * @return
     */
    public List<DriverDTO> getNotRetiredDriverList(SearchDTO searchDTO) {
        return driverDAO.getSearchedNotRetiredDriverList(searchDTO);
    }
}
