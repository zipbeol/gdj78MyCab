package com.my.cab.dao;

import com.my.cab.dto.AccidentDTO;
import com.my.cab.dto.SearchDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AccidentDAO {
    String getAccidentFirstDate(String idx);

    List<AccidentDTO> getAccidentList(SearchDTO searchDTO);

    int getAccidentCount(SearchDTO searchDTO);

    boolean checkTaxiExists(String accidentHistoryTaxiLicensePlate);

    boolean createAccidentHistory(AccidentDTO accidentDTO);

    String getDriverFirstAccidentDate(String driverIdx);
}
