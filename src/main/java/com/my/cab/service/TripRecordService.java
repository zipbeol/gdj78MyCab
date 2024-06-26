package com.my.cab.service;

import com.my.cab.dao.TripRecordDAO;
import com.my.cab.dto.FinanceDTO;
import com.my.cab.dto.TripRecordDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;


@Service
public class TripRecordService {

    Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    TripRecordDAO tripRecordDAO;

    @Transactional
    public boolean insertTripRecord(TripRecordDTO tripRecordDTO) {
        tripRecordDTO.setTrip_record_taxi_idx("3");
        boolean result = tripRecordDAO.insertTripRecord(tripRecordDTO);
        String[] recordLngs = tripRecordDTO.getRecordLngs();
        String[] recordLats = tripRecordDTO.getRecordLats();

        for (int i = 0; i < recordLats.length; i++) {
            result = tripRecordDAO.insertTripRecordDetail(tripRecordDTO.getTrip_record_idx(), recordLats[i], recordLngs[i]);
        }
//
//        FinanceDTO financeDTO = new FinanceDTO();
//        financeDTO.setPro_cash(Integer.parseInt(tripRecordDTO.getTrip_record_fare()));
//        financeDTO.setPro_category("택시");
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        financeDTO.setPro_actual_date(sdf.parse(tripRecordDTO.));
        return result;
    }
}
