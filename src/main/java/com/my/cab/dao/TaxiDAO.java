package com.my.cab.dao;

import com.my.cab.dto.SearchDTO;
import com.my.cab.dto.TaxiDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface TaxiDAO {

    void registerTaxi(TaxiDTO taxiDTO);

    boolean checkTaxiLicensePlateExists(String taxiLicensePlate);

    List<String> getTaxiModelList();

    List<TaxiDTO> getTaxiList(SearchDTO searchDTO);

    TaxiDTO getTaxiInfo(String licensePlate);

    boolean updateTaxiInfo(TaxiDTO taxiDTO);

    String getTaxiRegFirstDate();

    String getTaxiRegLastDate();

    int getTaxiCount(SearchDTO searchDTO);

    List<TaxiDTO> getSearchedList(SearchDTO searchDTO);

    boolean scrapUpdate(TaxiDTO taxiDTO);

    boolean scrapDelete(TaxiDTO taxiDTO);
}
