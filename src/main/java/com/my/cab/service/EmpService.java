package com.my.cab.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.my.cab.dao.EmpDAO;
import com.my.cab.dto.EmpDTO;
import com.my.cab.dto.SearchDTO;


@Service
public class EmpService {
	
	private String password = "";
	
	@Value("${spring.servlet.multipart.location}")
    private String uploadDir;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired EmpDAO dao;
	@Autowired PasswordEncoder encoder;
	
	private static final int PAGE_SIZE = 10;
	

	public int empRegistration(Map<String, Object> param) {
		
	
		String emp_bday = String.valueOf(param.get("emp_bday")).replace("-", "");
		logger.info("생일 : "+emp_bday);
		
		int emp_no =Integer.parseInt(String.valueOf(param.get("emp_no"))) ;
		password =  encoder.encode(emp_bday);
		String emp_name = (String) param.get("emp_name");
		String acc_name = (String) param.get("acc_name");
		int dept_no = Integer.parseInt(String.valueOf(param.get("dept_no"))) ;
		String acc_no = (String) param.get("acc_no");
		int title_no = Integer.parseInt(String.valueOf(param.get("title_no"))) ;
		String bank_name = (String) param.get("bank_name");
		
		String emp_email = param.get("email_id") + "@" + param.get("domain");
		logger.info(emp_email);
		
		
		String emp_add = param.get("emp_roadAdd") +" "+  param.get("emp_addDetail");
		
		
		String emp_extension_number = (String) param.get("emp_extension_number");
		int emp_level = Integer.parseInt(String.valueOf(param.get("emp_level"))) ;;
		
		
		EmpDTO dto = new EmpDTO();
		
		dto.setEmp_no(emp_no);
		dto.setEmp_password(password);
		dto.setEmp_name(emp_name);
		dto.setAcc_name(acc_name);
		dto.setBank_name(bank_name);
		dto.setDept_no(dept_no);
		dto.setAcc_no(acc_no);
		dto.setTitle_no(title_no);
		dto.setEmp_email(emp_email);
		dto.setEmp_add(emp_add);
		dto.setEmp_extension_number(emp_extension_number);
		dto.setEmp_level(emp_level);
		dto.setEmp_bday(emp_bday);
		dto.setEmp_employment_status(true);
		
		int row1 = dao.empJoin(dto);
		int row2 = dao.accJoin(dto);
		
		int totalRow = row1 + row2;
		
		
		return totalRow;
	}


	public int overlay(String email) {
		
		return dao.overlay(email);
	}


	public int getNextEmpNo(int deptNo) {
		
		int lastEmpNo = dao.getLastEmpNo(deptNo);
		
		return (deptNo * 10000) + lastEmpNo + 1;
	}


	public Map<String, Object> getEmpList(SearchDTO searchDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		int page = (searchDTO.getPage() - 1)*PAGE_SIZE;
		searchDTO.setPage(page);
		searchDTO.setPageSize(PAGE_SIZE);
		logger.info("page {}",page);
		logger.info("searchDTO page {}",searchDTO.getPage());
		List<EmpDTO> empList = dao.getEmpList(searchDTO);
		logger.info("empList {}", empList);
		result.put("empList", empList);
		
		
		return result;
	}


	public Map<String, Object> getEmpTotalPages(SearchDTO searchDTO) {
		int empTotal = dao.getEmpTotal(searchDTO);
		int totalPages = (int) Math.ceil((double)empTotal/PAGE_SIZE);
		totalPages = totalPages > 0? totalPages : 1;
		
		return Map.of("totalPages", totalPages);
	}




	public boolean updateEmp(EmpDTO empDTO) {
		boolean result = false;
		
		
		boolean isRetired = empDTO.isEmp_employment_status();
		
		if (isRetired) {
			
			result = dao.updateEmp(empDTO);
			
		}else {
			result = dao.updateEmpRetried(empDTO);
		}
		
		
		return result;
	}


	public EmpDTO getEmpDetail(String emp_no) {
	
		return dao.getEmpDetail(emp_no);
	}

}
