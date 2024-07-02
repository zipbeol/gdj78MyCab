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

    /**
     * 특정 택시의 사고 기록 첫번째 날짜 가져오기
     * @param idx
     * @return
     */
    public String getAccidentFirstDate(String idx) {
        return accidentDAO.getAccidentFirstDate(idx);
    }

    /**
     * 검색된 사고 기록 리스트{@code AccidentDTO} 가져오기
     * @param searchDTO
     * @return
     */
    public List<AccidentDTO> getAccidentList(SearchDTO searchDTO) {
        int page = PageCalc.calculatePageOffset(searchDTO.getPage(), PAGE_SIZE);
        searchDTO.setPage(page);
        searchDTO.setPageSize(PAGE_SIZE);
        return accidentDAO.getAccidentList(searchDTO);
    }

    /**
     * 검색된 리스트의 총 페이지수 가져오기
     * @param searchDTO
     * @return
     */
    public int getAccidentTotalPages(SearchDTO searchDTO) {
        int totalCount = accidentDAO.getAccidentCount(searchDTO);
        return PageCalc.calculateTotalPages(totalCount, PAGE_SIZE);
    }

    /**
     * 사고 기록 추가
     * @param accidentDTO
     * @return
     */
    public Map<String, Object> createAccidentHistory(AccidentDTO accidentDTO) {
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("result",  accidentDAO.createAccidentHistory(accidentDTO));
        return map;
    }

    /**
     * 특정 운전자{@code driverIdx}의 첫번째 사고 날짜
     * @param driverIdx
     * @return
     */
    public String getDriverFirstAccidentDate(String driverIdx) {
        return accidentDAO.getDriverFirstAccidentDate(driverIdx);
    }

    /**
     * 사고 상세정보
     * @param accidentIdx
     * @return
     */
    public AccidentDTO getAccidentDetail(String accidentIdx) {
        return accidentDAO.getAccidentDetail(accidentIdx);
    }

    /**
     * 사고 업데이트
     * @param accidentDTO
     * @return
     */
    public boolean updateAccidentHistory(AccidentDTO accidentDTO) {
        return accidentDAO.updateAccidentHistory(accidentDTO);
    }
}
