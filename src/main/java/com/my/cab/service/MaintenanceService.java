package com.my.cab.service;

import com.my.cab.dao.MaintenanceDAO;
import com.my.cab.dto.MaintenanceDTO;
import com.my.cab.dto.SearchDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class MaintenanceService {
	
	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	MaintenanceDAO maintenanceDAO;

	public List<MaintenanceDTO> getMaintenanaceList(SearchDTO searchDTO) {
		return maintenanceDAO.getMaintenanceList(searchDTO);
	}

	public boolean insertMaintenanceHistory(MaintenanceDTO maintenanceDTO) {
		return maintenanceDAO.insertMaintenanceHistory(maintenanceDTO);
	}
}
