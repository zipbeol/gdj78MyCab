package com.my.cab.service;

import com.my.cab.dao.DriverDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class DriverService {

    Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    DriverDAO driverDAO;

    /**
     * 택시기사 가장 오래된 등록일 가져오는 메서드
     * @return {@code String}
     */
    public String getDriverFirstRegDate() {
        return driverDAO.getDriverFirstRegDate();
    }
}
