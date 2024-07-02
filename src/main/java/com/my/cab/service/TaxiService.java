package com.my.cab.service;

import com.my.cab.dao.TaxiDAO;
import com.my.cab.dto.SearchDTO;
import com.my.cab.dto.TaxiDTO;
import com.my.cab.util.PageCalc;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class TaxiService {

    Logger logger = LoggerFactory.getLogger(getClass());

    private static final int PAGE_SIZE = 10;

    @Autowired
    TaxiDAO taxiDAO;
    @Autowired
    private AccidentService accidentService;


    public Map<String, Object> listAjax(SearchDTO searchDTO) {
        Map<String, Object> result = new HashMap<>();
        int page = PageCalc.calculatePageOffset(searchDTO.getPage(), PAGE_SIZE);
        logger.info("page {}", page);
        logger.info("searchDTO page {}", searchDTO.getPage());
        searchDTO.setPage(page);
        searchDTO.setPageSize(PAGE_SIZE);
        logger.info("searchDTO pageSize {}", searchDTO.getPageSize());
        List<TaxiDTO> taxiList = getTaxiList(searchDTO);
        result.put("taxiList", taxiList);
        return result;
    }

    /**
     * 택시 번호판이 db에 존재하는지 확인하는 메서드
     *
     * @param licensePlate
     * @return 존재하면 true 없으면 false
     */
    public boolean checkTaxiLicensePlateExists(String licensePlate) {
        return taxiDAO.checkTaxiLicensePlateExists(licensePlate);
    }

    /**
     * 택시 리스트 검색한 리스트 리턴
     *
     * @param searchDTO
     * @return
     */
    public List<TaxiDTO> getTaxiList(SearchDTO searchDTO) {
        return taxiDAO.getTaxiList(searchDTO);
    }

    /**
     * 택시 차종 리스트 리턴
     *
     * @return
     */
    public List<String> getTaxiModelList() {
        return taxiDAO.getTaxiModelList();
    }

    /**
     * 택시 등록
     *
     * @param taxiDTO dto 항목에는 {@code taxi_license_plate}, {@code taxi_model}, {@code taxi_fuel_type}, {@code taxi_year}이 필요합니다.
     * @return Map(" message ", 결과메세지);
     */
    public Map<String, Object> registerTaxi(TaxiDTO taxiDTO) {
        Map<String, Object> result = new HashMap<>();
        String message = taxiDTO.getTaxi_license_plate() + " 택시 등록에 성공하였습니다.";
        boolean isSuccess = false;
        if (checkTaxiLicensePlateExists(taxiDTO.getTaxi_license_plate())) {
            message = taxiDTO.getTaxi_license_plate() + " 택시는 이미 등록된 번호판 입니다.";
        } else {
            taxiDAO.registerTaxi(taxiDTO);
            isSuccess = true;
        }
        result.put("message", message);
        result.put("isSuccess", isSuccess);
        return result;
    }

    /**
     * 특정 택시 정보 가져오는 메서드
     *
     * @param taxi_idx
     * @return {@code TaxiDTO}
     */
    public TaxiDTO getTaxiInfo(String taxi_idx) {
        return taxiDAO.getTaxiInfo(taxi_idx);
    }

    /**
     * 택시 정보 업데이트 한 후 결과 내보내는 메서드
     *
     * @param taxiDTO
     * @return {@code Map}
     */
    public Map<String, Object> updateTaxiInfo(TaxiDTO taxiDTO) {
        Map<String, Object> result = new HashMap<>();
        result.put("result", taxiDAO.updateTaxiInfo(taxiDTO));
        return result;
    }

    /**
     * 택시 가장 오래된 등록일 가져오는 메서드
     *
     * @return {@code String}
     */
    public String getTaxiRegFirstDate() {
        return taxiDAO.getTaxiRegFirstDate();
    }


    /**
     * 페이지 계산
     *
     * @param searchDTO
     * @return
     */
    public int getTotalPages(SearchDTO searchDTO) {
        int totalCount = taxiDAO.getTaxiCount(searchDTO);
        return PageCalc.calculateTotalPages(totalCount, PAGE_SIZE);
    }

    /**
     * 검색된 택시 기사 리스트 페이지 제한 X
     *
     * @param searchDTO
     * @return
     */
    public List<TaxiDTO> getSearchedList(SearchDTO searchDTO) {
        return taxiDAO.getSearchedList(searchDTO);
    }

    /**
     * 폐차 등록과 결과
     *
     * @param searchDTO
     * @return
     */
    public Map<String, Object> getScrapInfoAndResult(SearchDTO searchDTO) {
        Map<String, Object> map = new HashMap<String, Object>();
        TaxiDTO dto = getTaxiInfo(searchDTO.getSearchIdx());
        boolean result = false;
        logger.info(dto.getTaxi_is_active());

        if (dto.getTaxi_is_active() != null && dto.getTaxi_is_active().equals("0")) {
            map.put("info", dto);
            result = true;
        }
        map.put("result", result);
        return map;
    }

    /**
     * 사고 등록
     *
     * @param taxiDTO
     * @return
     */
    public boolean scrapRegister(TaxiDTO taxiDTO) {
        return taxiDAO.scrapUpdate(taxiDTO);
    }

    /**
     * 사고 수정
     *
     * @param taxiDTO
     * @return
     */
    public boolean scrapUpdate(TaxiDTO taxiDTO) {
        return taxiDAO.scrapUpdate(taxiDTO);
    }

    /**
     * 사고 삭제 ({@code is_active}비활성 처리)
     *
     * @param taxiDTO
     * @return
     */
    public boolean scrapDelete(TaxiDTO taxiDTO) {
        return taxiDAO.scrapDelete(taxiDTO);
    }
}
