package com.my.cab.dao;

import com.my.cab.dto.MaintenanceDTO;
import com.my.cab.dto.SearchDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MaintenanceDAO {

    List<MaintenanceDTO> getMaintenanceList(SearchDTO searchDTO);

    boolean insertMaintenanceHistory(MaintenanceDTO maintenanceDTO);

    String getMaintenanceFirstDate(String taxiIdx);

    int getMaintenanceCount(SearchDTO searchDTO);

    MaintenanceDTO getMaintenanceDetail(String maintenanceIdx);
}
