package com.my.cab.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.my.cab.dao.ResourceDAO;


@Service
public class ResourceService {
	
	private final ResourceDAO resourceDao;
	
	public ResourceService (ResourceDAO resourceDao) {
		this.resourceDao = resourceDao;
	}
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public int resourceWrite(Map<String, Object> param , MultipartFile file) {
		int row = 0;
		if(param.get("resourceType").equals("차량")) {
			int resource_idx = resourceDao.resourceWrite(param);
			if(resource_idx >0) {
				param.put("idx", resource_idx);
				row = resourceDao.resourceWriteCar(param);
				logger.info("자동차 작성 :"+row);
			}
		}else if(param.get("resourceType").equals("회의실")){
			int resource_idx = resourceDao.resourceWrite(param);
			if(resource_idx >0) {
				param.put("idx", resource_idx);
				row = resourceDao.resourceWriteMeetRomm(param);		
				logger.info("회의실 작성 :"+row);
			}
			
		}else if(param.get("resourceType").equals("비품")){
			int resource_idx = resourceDao.resourceWrite(param);
			if(resource_idx >0) {
				param.put("idx", resource_idx);
				row = resourceDao.resourceWriteEquip(param);	
				logger.info("비품 작성 :"+row);
			}			
		}else {
			logger.info("자원 등록 이상함");
		}
		
		
		return row;
		
	}

}
