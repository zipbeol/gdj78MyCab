package com.my.cab.service;

import com.my.cab.dao.FinanceDAO;
import com.my.cab.dao.TripRecordDAO;
import com.my.cab.dto.*;
import com.my.cab.util.DateFormatter;
import com.my.cab.util.PageCalc;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;


@Service
public class TripRecordService {

    Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    TripRecordDAO tripRecordDAO;

    @Autowired
    FinanceDAO financeDAO;

    private static final int PAGE_SIZE = 10;

    /**
     * 운행 기록 추가, 운행좌표들 저장
     *
     * @param tripRecordDTO
     * @return
     */
    @Transactional
    public boolean insertTripRecord(TripRecordDTO tripRecordDTO) {
        ////////////////// 나중에 수정 필요 ///////////////////
        tripRecordDTO.setTrip_record_taxi_idx("3");
        /////////////////////////////////////////////////
        boolean result = tripRecordDAO.insertTripRecord(tripRecordDTO);
        String[] recordLngs = tripRecordDTO.getRecordLngs();
        String[] recordLats = tripRecordDTO.getRecordLats();

        for (int i = 0; i < recordLats.length; i++) {
            result = tripRecordDAO.insertTripRecordDetail(tripRecordDTO.getTrip_record_idx(), recordLats[i], recordLngs[i]);
        }
        FinanceDTO financeDTO = new FinanceDTO();
        financeDTO.setPro_category("택시");
        financeDTO.setPro_actual_date(tripRecordDAO.getTripRecordDate(tripRecordDTO));
        financeDTO.setPro_content("택시 운행");
        financeDTO.setPro_who(tripRecordDTO.getTrip_record_driver_name());
        financeDTO.setPro_cash(Integer.parseInt(tripRecordDTO.getTrip_record_fare()));
        financeDTO.setPro_trip_id(Integer.parseInt(tripRecordDTO.getTrip_record_idx()));
        financeDTO.setDeal_pro_idx(financeDTO.getPro_idx());
        financeDTO.setDeal_category("수익");
        financeDTO.setProfit(true);
        financeDAO.addProfit(financeDTO);
        financeDAO.addDeal(financeDTO);
        return result;
    }


    public String getFirstTripDate() {
        return tripRecordDAO.getFirstTripDate();
    }


    public Map<String, Object> listTripRecord(SearchDTO searchDTO) {
        int page = PageCalc.calculatePageOffset(searchDTO.getPage(), PAGE_SIZE);
        searchDTO.setPage(page);
        searchDTO.setPageSize(PAGE_SIZE);
        return Map.of("list", tripRecordDAO.getTripList(searchDTO));
    }

    public Map<String, Object> totalPageTripRecord(SearchDTO searchDTO) {
        int totalCount = tripRecordDAO.getTripRecordCount(searchDTO);
        return Map.of("totalPages", PageCalc.calculateTotalPages(totalCount, PAGE_SIZE));
    }

    public TripRecordDTO getTripInfo(String tripRecordIdx) {
        return tripRecordDAO.getTripInfo(tripRecordIdx);
    }

    public List<CoordinateDTO> getTripLocationData(String tripRecordIdx) {
        return tripRecordDAO.getTripLocationData(tripRecordIdx);
    }
}
