package com.my.cab.service;

import com.my.cab.dao.TaxiDAO;
import com.my.cab.dto.SearchDTO;
import com.my.cab.dto.TaxiDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class TaxiService {

    Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    TaxiDAO taxiDAO;

    public Map<String, Object> listAjax(SearchDTO searchDTO) {
        Map<String, Object> result = new HashMap<>();
        List<TaxiDTO> taxiList = null;
        boolean isSuccess = false;
//        if (searchDTO.getSearchText() != null && !checkTaxiLicensePlateExists(searchDTO.getSearchText())) {
//            taxiList = getTaxiList();
//        } else {
//            taxiList = getSearchedTaxiList(searchDTO);
//            isSuccess = true;
//        }
        taxiList = getSearchedTaxiList(searchDTO);
        result.put("taxiList", taxiList);
        result.put("result", isSuccess);
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
     * {@code TaxiDTO}리스트 리턴해주는 메서드
     *
     * @return List<TaxiDTO>
     */
    public List<TaxiDTO> getTaxiList() {
        return taxiDAO.getTaxiList();
    }

    /**
     * 택시 리스트 검색한 리스트 리턴
     * @param searchDTO
     * @return
     */
    public List<TaxiDTO> getSearchedTaxiList(SearchDTO searchDTO) {
        return taxiDAO.getSearchedTaxiList(searchDTO);
    }

    /**
     * 택시 차종 리스트 리턴
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

    public TaxiDTO getTaxiInfo(String taxi_idx) {
        return taxiDAO.getTaxiInfo(taxi_idx);
    }

    public Map<String, Object> updateTaxiInfo(TaxiDTO taxiDTO) {
        ;
        Map<String, Object> result = new HashMap<>();
        result.put("result", taxiDAO.updateTaxiInfo(taxiDTO));
        return result;
    }
}
