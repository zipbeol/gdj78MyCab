package com.my.cab.service;

import com.my.cab.dao.AccidentDAO;
import com.my.cab.dto.AccidentDTO;
import com.my.cab.dto.SearchDTO;
import com.my.cab.util.PageCalc;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AccidentService {

    Logger logger = LoggerFactory.getLogger(getClass());
    private static final int PAGE_SIZE = 10;
    @Autowired
    AccidentDAO accidentDAO;

    public String getAccidentFirstDate(String idx) {
        return accidentDAO.getAccidentFirstDate(idx);
    }

    public List<AccidentDTO> getAccidentList(SearchDTO searchDTO) {
        int page = PageCalc.calculatePageOffset(searchDTO.getPage(), PAGE_SIZE);
        searchDTO.setPage(page);
        searchDTO.setPageSize(PAGE_SIZE);
        return accidentDAO.getAccidentList(searchDTO);
    }

    public int getAccidentTotalPages(SearchDTO searchDTO) {
        int totalCount = accidentDAO.getAccidentCount(searchDTO);
        return PageCalc.calculateTotalPages(totalCount, PAGE_SIZE);
    }

    public Map<String, Object> createAccidentHistory(AccidentDTO accidentDTO) {
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("result",  accidentDAO.createAccidentHistory(accidentDTO));
        return map;
    }

    public String getDriverFirstAccidentDate(String driverIdx) {
        return accidentDAO.getDriverFirstAccidentDate(driverIdx);
    }

    public AccidentDTO getAccidentDetail(String accidentIdx) {
        return accidentDAO.getAccidentDetail(accidentIdx);
    }
}
