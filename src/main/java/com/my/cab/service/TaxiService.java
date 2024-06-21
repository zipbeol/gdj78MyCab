package com.my.cab.service;

import com.my.cab.dao.TaxiDAO;
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

    public Map<String, Object> listAjax() {
        Map<String, Object> result = new HashMap<>();
        result.put("taxiList", getTaxiList());
        return result;
    }

    public List<TaxiDTO> getTaxiList() {
        return taxiDAO.getTaxiList();
    }

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
        String message = taxiDTO.getTaxi_license_plate() + " 택시 등록에 성공하였습니다..";
        boolean isSuccess = false;
        if (isSameTaxiLicensePlate(taxiDTO.getTaxi_license_plate())) {
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
     * 택시 번호판 넣으면 중복인지 확인해 주는 메서드
     *
     * @param taxiLicensePlate
     * @return 중복이면 true 아니면 false
     */
    private boolean isSameTaxiLicensePlate(String taxiLicensePlate) {
        return taxiDAO.isSameTaxiLicensePlate(taxiLicensePlate);
    }
}
