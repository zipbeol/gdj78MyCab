package com.my.cab.service;

import com.my.cab.dao.MaintenanceDAO;
import com.my.cab.dto.MaintenanceDTO;
import com.my.cab.dto.SearchDTO;
import com.my.cab.util.PageCalc;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class MaintenanceService {
	
	Logger logger = LoggerFactory.getLogger(getClass());

	private static final int PAGE_SIZE = 10;

	@Autowired
	MaintenanceDAO maintenanceDAO;

	public List<MaintenanceDTO> getMaintenanaceList(SearchDTO searchDTO) {
		int page = PageCalc.calculatePageOffset(searchDTO.getPage(), PAGE_SIZE);
		searchDTO.setPage(page);
		searchDTO.setPageSize(PAGE_SIZE);
		return maintenanceDAO.getMaintenanceList(searchDTO);
	}

	public boolean insertMaintenanceHistory(MaintenanceDTO maintenanceDTO) {
		return maintenanceDAO.insertMaintenanceHistory(maintenanceDTO);
	}

	public String getMaintenanceFirstDate(String taxiIdx) {
		return maintenanceDAO.getMaintenanceFirstDate(taxiIdx);
	}

	public int getMaintenanceTotalPages(SearchDTO searchDTO) {
		int totalCount = maintenanceDAO.getMaintenanceCount(searchDTO);
		return PageCalc.calculateTotalPages(totalCount, PAGE_SIZE);
	}
}
