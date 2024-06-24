package com.my.cab.dao;

import com.my.cab.dto.DriverDTO;
import com.my.cab.dto.SearchDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DriverDAO {

    String getDriverFirstRegDate();

    boolean insertDriverInfo(DriverDTO driverDTO);

    boolean updateDriverPhoto(DriverDTO driverDTO);

    boolean updateDriverTaxiLicensePhoto(DriverDTO driverDTO);

    List<DriverDTO> getDriverList(SearchDTO searchDTO);

    int getDriverTotal(SearchDTO searchDTO);

    DriverDTO getDriverInfo(String driverIdx);
}
