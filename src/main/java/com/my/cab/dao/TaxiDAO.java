package com.my.cab.dao;

import com.my.cab.dto.TaxiDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TaxiDAO {

    List<TaxiDTO> getTaxiList();

    void registerTaxi(TaxiDTO taxiDTO);

    boolean isSameTaxiLicensePlate(String taxiLicensePlate);

    List<String> getTaxiModelList();
}
