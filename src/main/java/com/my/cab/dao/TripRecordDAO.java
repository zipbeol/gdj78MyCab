package com.my.cab.dao;

import com.my.cab.dto.TripRecordDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TripRecordDAO {

    boolean insertTripRecord(TripRecordDTO tripRecordDTO);

    boolean insertTripRecordDetail(String tripRecordIdx, String recordLat, String recordLng);
}
