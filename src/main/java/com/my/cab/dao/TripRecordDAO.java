package com.my.cab.dao;

import com.my.cab.dto.SearchDTO;
import com.my.cab.dto.TripRecordDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TripRecordDAO {

    boolean insertTripRecord(TripRecordDTO tripRecordDTO);

    boolean insertTripRecordDetail(String tripRecordIdx, String recordLat, String recordLng);

    String getFirstTripDate();

    List<TripRecordDTO> getTripList(SearchDTO searchDTO);

    int getTripRecordCount(SearchDTO searchDTO);
}
