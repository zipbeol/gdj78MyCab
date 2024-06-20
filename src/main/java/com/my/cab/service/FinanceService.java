package com.my.cab.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;


@Service
public class FinanceService {
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public List<String> getProfitList() {
        List<String> profitList = new ArrayList()<>();
        profitList.add("");
        profitList.add("");
        profitList.add("");
        return profitList;
	}

}
