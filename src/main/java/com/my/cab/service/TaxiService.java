package com.my.cab.service;

import com.my.cab.dao.TaxiDAO;
import com.my.cab.dto.TaxiDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.List;


@Service
public class TaxiService {
	
	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	TaxiDAO taxiDAO;
}
