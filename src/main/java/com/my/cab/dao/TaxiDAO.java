package com.my.cab.dao;

import com.my.cab.dto.SearchDTO;
import com.my.cab.dto.TaxiDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface TaxiDAO {

    List<TaxiDTO> getTaxiList();

    void registerTaxi(TaxiDTO taxiDTO);

    boolean checkTaxiLicensePlateExists(String taxiLicensePlate);

    List<String> getTaxiModelList();

    List<TaxiDTO> getSearchedTaxiList(SearchDTO searchDTO);

    TaxiDTO getTaxiInfo(String licensePlate);

    boolean updateTaxiInfo(TaxiDTO taxiDTO);
}
