package com.my.cab.controller;

import java.util.HashMap;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.cab.dto.EmpDTO;
import com.my.cab.dto.MyPageDTO;
import com.my.cab.dto.SearchDTO;
import com.my.cab.service.EmpService;

@Controller
public class EmpController {

	Logger logger = LoggerFactory.getLogger(getClass());
	private final EmpService service;

	public EmpController(EmpService service) {
		this.service = service;
	}

	@GetMapping("/emp/emp/noOffsetEmpList.ajax")
	@ResponseBody
	public Map<String, Object> noOffsetEmpList(SearchDTO searchDTO) {
		return Map.of("EmpList", service.getNoOffsetEmpList(searchDTO));
	}

	@RequestMapping(value = "emp/emp/create.go")
	public String Registration() {

		logger.info("사원 등록 페이지로 이동");

		return "HR/empRegistration";
	}

	@RequestMapping(value = "emp/emp/emailOverlay.ajax")
	@ResponseBody
	public Map<String, Object> overlay(String email) {
		logger.info("중복 확인 요청 email : " + email);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("use", service.overlay(email));

		return map;
	}

	@RequestMapping(value = "emp/emp/getNextEmpNo.ajax")
	@ResponseBody
	public Map<String, Object> getNextEmpNo(int deptNo) {
		logger.info("생성 할 사원 부서번호 : " + deptNo);
		Map<String, Object> map = new HashMap<String, Object>();

		int nextEmpNo = service.getNextEmpNo(deptNo);
		logger.info("다음 사원 번호 : " + String.valueOf(nextEmpNo));

		map.put("nextEmpNo", nextEmpNo);

		return map;
	}

	@RequestMapping(value = "emp/join.do")
	public String empRegistration(@RequestParam Map<String, Object> param, RedirectAttributes redirectAttributes) {
		logger.info("사원 등록 요청");
		logger.info("param : {}", param);

		int row = service.empRegistration(param);
		if (row > 0) {
			logger.info("사원 등록 성공");
			redirectAttributes.addFlashAttribute("message", "사원 등록이 완료되었습니다.");
			return "redirect:/";
		} else {
			redirectAttributes.addFlashAttribute("message", "사원 등록에 실패하였습니다.");
			return "redirect:/";
		}

	}

	@RequestMapping(value = "emp/hremp/list.go")
	public String hremp() {
		logger.info("인사부용 사원 조회 이동");

		return "HR/hrEmpList";
	}

	@GetMapping(value = "emp/hremp/hrEmpList.ajax")
	@ResponseBody
	public Map<String, Object> hrEmpList(SearchDTO searchDTO) {
		logger.info("\nsearchDTO SearchText:" + searchDTO.getSearchText() + "\nsearchDTO filterIsRetired:"
				+ searchDTO.getFilterIsRetired() + "\nsearchDTO filterIsRetired:" + searchDTO.getFilterForSearch()
				+ "\nsearchDTO page:" + searchDTO.getPage());

		return service.getEmpList(searchDTO);

	}

	@GetMapping(value = "emp/hremp/getTotalPages.ajax")
	@ResponseBody
	public Map<String, Object> getTotalPages(SearchDTO searchDTO) {

		return service.getEmpTotalPages(searchDTO);
	}

	@RequestMapping(value = "emp/hremp/empDetail.go")
	public String empDetail(Model model, String emp_no) {
		logger.info(emp_no + " 사원 상세보기 요청");

		EmpDTO empDTO = service.getEmpDetail(emp_no);
		model.addAttribute("empDetail", empDTO);

		return "HR/empDetail";
	}

	@GetMapping("emp/hremp/updateEmp.ajax")
	@ResponseBody
	public Map<String, Object> updateEmp(EmpDTO empDTO) {
		logger.info("사원 수정 요청");
		logger.info("수정할 사번 : " + empDTO.getEmp_no());
		logger.info("수정할 재직상태 : " + empDTO.isEmp_employment_status());

		boolean isSuccess = service.updateEmp(empDTO);

		return Map.of("isSuccess", isSuccess);

	}

	@RequestMapping(value = "emp/vac/list.go")
	public String vacList() {
		logger.info("연차 관리 이동");

		return "HR/vacManagement";
	}

	@GetMapping(value = "/vacList.ajax")
	@ResponseBody
	public Map<String, Object> vacList(SearchDTO searchDTO) {
		logger.info("\nsearchDTO SearchText:" + searchDTO.getSearchText() + "\nsearchDTO FilterForSearch:"
				+ searchDTO.getFilterForSearch() + "\nsearchDTO page:" + searchDTO.getPage());

		return service.getVacList(searchDTO);

	}

	@GetMapping(value = "/getVacTotalPages.ajax")
	@ResponseBody
	public Map<String, Object> getVacTotalPages(SearchDTO searchDTO) {

		return service.getVacTotalPages(searchDTO);
	}

	@GetMapping("/addVac.ajax")
	@ResponseBody
	public Map<String, Object> addVac(EmpDTO empDTO) {
		logger.info("사원 연차 지급");
		logger.info("연차 지급할 사번 : " + empDTO.getEmp_no());

		boolean isSuccess = service.addVac(empDTO);

		return Map.of("isSuccess", isSuccess);
	}

	@GetMapping("/vacEditValue.ajax")
	@ResponseBody
	public Map<String, Object> vacEditValue(EmpDTO empDTO) {
		logger.info("사원 연차 지급");
		logger.info("연차 지급할 사번 : " + empDTO.getEmp_no());

		boolean isSuccess = service.vacEditValue(empDTO);

		return Map.of("isSuccess", isSuccess);
	}

	@RequestMapping(value = "emp/vac/finalList.go")
	public String vacFinal() {
		logger.info("최고관리자용 연차 승인 페이지 이동");

		return "HR/vacApprovalFinal";
	}

	@GetMapping(value = "/vacFinalList.ajax")
	@ResponseBody
	public Map<String, Object> vacApprovalList(SearchDTO searchDTO) {
		logger.info("\nsearchDTO filterVacDate:" + searchDTO.getFilterVacDate() + "\nsearchDTO filterVacResult:"
				+ searchDTO.getFilterVacResult());

		return service.vacFinalList(searchDTO);

	}

	@GetMapping(value = "/getVacFinalTotalPages.ajax")
	@ResponseBody
	public Map<String, Object> getVacApprovalTotalPages(SearchDTO searchDTO) {

		return service.getVacFinalTotalPages(searchDTO);
	}

	@RequestMapping(value = "/vacApprovalFinalDetail.go")
	public String vacApplyDetailFinal(String vac_no, Model model) {
		logger.info("연차 신청 상세페이지 이동");
		EmpDTO empDTO = service.vacApplyDetailFinal(vac_no);
		model.addAttribute("vacList", empDTO);

		return "HR/vacApprovalFinalDetail";
	}

	@GetMapping(value = "vacFinalApproval.ajax")
	@ResponseBody
	public Map<String, Object> vacFinalApproval(EmpDTO empDTO) {
		logger.info("연차 승인");
		logger.info("연차 승인한 vac_no : " + empDTO.getVac_no());

		String start_date = empDTO.getVac_use_date();
		double use = empDTO.getVac_use();

		logger.info("시작" + start_date);
		logger.info("사용량" + use);

		
		 boolean isSuccess = service.vacFinalApproval(empDTO);
		 
		 return Map.of("isSuccess", isSuccess);
		
	}

	@GetMapping(value = "vacFinalReject.ajax")
	@ResponseBody
	public Map<String, Object> vacFinalReject(EmpDTO empDTO) {
		logger.info("연차 반려");
		logger.info("연차 반려한 vac_no : " + empDTO.getVac_no());

		boolean isSuccess = service.vacFinalReject(empDTO);

		return Map.of("isSuccess", isSuccess);

	}
	
	@RequestMapping(value="emp/orgchart/list.go")
	public String orgChart() {
		logger.info("조직도 이동");
		
		return "HR/orgChart";
		
	}
	
	@RequestMapping(value="emp/emp/list.go")
	public String empList() {
		logger.info("사원 조회로 이동");
		
		return "HR/empList";
	}
	
	
	@GetMapping(value="/getEmpDetail.ajax")
	@ResponseBody
	public Map<String, Object> getEmpDetail(EmpDTO empDTO){
		logger.info("사원 모달 요청");
	
		return service.getEmpDetailModal(empDTO);
	}
	
	
	
	@GetMapping(value = "/empList.ajax")
	@ResponseBody
	public Map<String, Object> empList(SearchDTO searchDTO) {
		logger.info("\nsearchDTO SearchText:" + searchDTO.getSearchText()
				+ "\nsearchDTO page:" + searchDTO.getPage());

		return service.empList(searchDTO);

	}

	@GetMapping(value = "/getEmpTotalPages.ajax")
	@ResponseBody
	public Map<String, Object> getEmpTotalPages(SearchDTO searchDTO) {

		return service.getEmpTotalPagesForEmp(searchDTO);
	}
	
	
	@RequestMapping(value="/emp/sal/list.go")
	public String empSalList() {
	
		return "HR/empSalaryList";
	}
	
	
	@GetMapping(value = "/totalSalList.ajax")
	@ResponseBody
	public Map<String, Object> totalSalList(SearchDTO searchDTO) {
		logger.info("\nsearchDTO SearchText:" + searchDTO.getSearchText()
				+ "\nsearchDTO page:" + searchDTO.getPage()+ "\nsearchDTO page:" + searchDTO.getFilterSalResult());

		return service.totalSalList(searchDTO);

	}

	@GetMapping(value = "/getSalTotalPages.ajax")
	@ResponseBody
	public Map<String, Object> getSalTotalPages(SearchDTO searchDTO) {

		return service.getSalTotalPages(searchDTO);
	}
	
	@RequestMapping(value="/emp/sal/write.go")
	public String salaryWrite(String emp_no, Model model) {
		logger.info(emp_no + "급여명세서 작성");
		
		EmpDTO empDTO = service.salaryWrite(emp_no);
		
		
		model.addAttribute("emp", empDTO);
		
	
		return "HR/salaryWrite";
	}
	
	@GetMapping(value="/calculateDeductions.ajax")
	@ResponseBody
	public Map<String, Object> calculateDeductions(@RequestParam("totalSalary") int totalSalary){
		logger.info("급여 계산 요청");
		logger.info("급여?"+totalSalary);
		
        
        Map<String, Object> params = new HashMap<>();
        params.put("totalSalary", totalSalary);


	        return service.calculateDeductions(params);
	}
	
	
	@GetMapping(value = "/writeSalary.ajax")
	@ResponseBody
	public Map<String, Object> writeSalary(EmpDTO empDTO) {
		logger.info("급여명세서 작성");
		logger.info("급여명세서 작성 대상 : " + empDTO.getSal_emp_no());

		boolean isSuccess = service.writeSalary(empDTO);

		return Map.of("isSuccess", isSuccess);

	}
	
	
	@RequestMapping(value="/emp/sal/detail.go")
	public String salaryDetail(String emp_no, Model model) {
		logger.info(emp_no + "급여명세서 작성");
		
		EmpDTO empDTO = service.salaryDetail(emp_no);
		
		
		model.addAttribute("emp", empDTO);
		
	
		return "HR/salaryDetail";
	}
	
	@RequestMapping(value="/emp/driver/list.go")
	public String driverSalList() {
		
		return "HR/driverSalary";
	}
	
	
	@GetMapping(value = "/totalDriverList.ajax")
	@ResponseBody
	public Map<String, Object> totalDriverList(SearchDTO searchDTO) {
		logger.info("\nsearchDTO SearchText:" + searchDTO.getSearchText()
				+ "\nsearchDTO page:" + searchDTO.getPage()+ "\nsearchDTO page:" + searchDTO.getFilterSalResult());

		return service.totalDriverList(searchDTO);

	}

	@GetMapping(value = "/getDriverTotalPages.ajax")
	@ResponseBody
	public Map<String, Object> getDriverTotalPages(SearchDTO searchDTO) {

		return service.getDriverTotalPages(searchDTO);
	}
	
	
	@RequestMapping(value="/triprecord/empList.go")
	public String tripEmp() {
		
		return "HR/tripRecordEMP";
	}
	
	@RequestMapping(value="/emp/sal/setSal.go")
	public String setSal() {
		
		return "HR/setSal";
	}
	

}