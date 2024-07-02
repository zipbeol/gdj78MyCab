package com.my.cab.controller;

import java.io.Console;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.my.cab.dto.ApprovalDTO;
import com.my.cab.dto.ApprovalDocDTO;
import com.my.cab.dto.DocumentDTO;
import com.my.cab.dto.EmpDTO;
import com.my.cab.service.ApprovalService;



@Controller
public class ApprovalController {
	
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ApprovalService apprservice;
	
	// 저장 디렉토리
    private static final String UPLOAD_DIR = "C:/upload"; 

    // 애플리케이션 시작 시 저장 디렉토리 생성
    static {
        File uploadDir = new File(UPLOAD_DIR);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
    }
	
    // 기안서 작성 페이징 이동 요청
	@RequestMapping(value="/approval/approvalWriteForm.go") // value 수정
	public String approvalWriteForm() {
		logger.info("기안서 작성 페이지 이동");	
		return "approval/approvalWriteForm";
	}
	
	// 기안서 데이터 db 저장
	@PostMapping("approval/save-html.fetch")
	public String saveHtmlFile(
	        @RequestParam("htmlContent") String htmlContent,
	        @RequestParam("date") String date,
	        @RequestParam("title") String title,
	        @RequestParam("approverline") String approverLine,
	        @RequestParam("midApprover") String midApprover,
	        @RequestParam("finalApprover") String finalApprover,
	        @RequestParam("participator") String participator,
	        @RequestParam(value = "file", required = false) MultipartFile file,
	        @RequestParam("isFinal") boolean isFinal,
	        HttpSession session,
	        Model model) {
	    try {
	        System.out.println("Received HTML content: " + htmlContent);

	        // 현재 시간을 밀리초 단위로 가져옴
	        String timeStamp = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date(System.currentTimeMillis()));
	        String fileName = "approval_file_" + timeStamp + ".html"; // session 에 저장 되는 loginId 이용하여 변경
	        String filePath = UPLOAD_DIR + File.separator + fileName; // 저장 경로 수정
	        
	        String drafterId = (String)session.getAttribute("loginId");
	        logger.info("아이디 추가 확인 : "+drafterId);
	        
	        
	        // HTML 파일 저장
	        File htmlFile = new File(filePath);
	        FileOutputStream fos = new FileOutputStream(htmlFile);
	        fos.write(htmlContent.getBytes());
	        fos.close();

	        // 수정한 html의 파일 경로를 데이터베이스에 저장
	        ApprovalDocDTO approvalDoc = new ApprovalDocDTO();
	        approvalDoc.setApproval_doc_path(filePath); 
	        approvalDoc.setApproval_doc_write_date(date); // 기안서 작성일
	        approvalDoc.setApproval_doc_title(title); // 기안서 제목
	        approvalDoc.setApproval_doc_assist_user(participator); // 참조자
	        approvalDoc.setApproval_doc_isFinal(isFinal); // 최종결재 여부
	        approvalDoc.setApproval_doc_id(drafterId); // 기안자 ID
	        apprservice.saveApprovalDoc(approvalDoc); // 14번 문서 등록 성공

	        // 첨부 파일 저장
	        String uploadFilePath = null;
	        if (file != null && !file.isEmpty()) {
	            String originalFilename = file.getOriginalFilename();
	            uploadFilePath = UPLOAD_DIR + File.separator + originalFilename;
	            File uploadedFile = new File(uploadFilePath);
	            file.transferTo(uploadedFile);
	            System.out.println("Uploaded file saved at: " + uploadFilePath);
	            // 필요한 경우 첨부 파일 경로를 데이터베이스에 저장
	            DocumentDTO docItemFileDTO = new DocumentDTO();
	            docItemFileDTO.setAppr_file_path(uploadFilePath);
	            apprservice.saveAttachedFilePath(uploadFilePath);
	        }

	        // 결재라인 등 데이터베이스에 저장 approvalDTO 테이블
	        ApprovalDTO approval = new ApprovalDTO();
	        approval.setApproval_doc_idx(approvalDoc.getApproval_doc_idx());
	        approval.setAppr_line_bkmk_idx(approverLine); // 결재라인
	        approval.setAppr_midapprover(midApprover); // 중간결재자
	        approval.setAppr_finalapprover(finalApprover); // 최종결재자
	        apprservice.saveApproval(approval);

	        System.out.println("File saved at: " + filePath);

	        model.addAttribute("message", "File saved successfully: " + fileName);
	        return "success";
	    } catch (Exception e) {
	        e.printStackTrace();
	        model.addAttribute("message", "Error saving file");
	        return "error";
	    }
	}

    
	// 중간.최종 결재자 선택 시 사원 리스트 조회/검색
	@GetMapping("/approvalList.ajax")
	@ResponseBody
	public List<EmpDTO> getEmployees(@RequestParam(required = false) String search) {
	    return apprservice.getEmployees(search);
	}
	
    // 내 결재 관리 페이지 이동 요청
	@RequestMapping(value="/approval/myapproval.go")
	public String myapproval(Model model) {
		logger.info("내 결재 관리 페이지 이동");		
		return "approval/myapproval";
	}
	
	// 결재라인 가져오기
	@PostMapping("/getApprovalLines.ajax")
	    @ResponseBody
	    public List<Map<String, Object>> getApprovalLines(@RequestParam(required = false) String searchLine) {
	        return apprservice.getApprovalLines(searchLine);
	    }
	
	// 결재라인에 따라 중간결재자, 최종결재자 불러오기
	@GetMapping("/getApproverDetails.ajax")
	@ResponseBody
	public Map<String, String> getApproverDetails(@RequestParam("lineId") String lineId) {
	    return apprservice.getApproverDetails(lineId);
	}
	
	// 내 결재 관리 결재문서 리스트 조회
    @PostMapping("/getApprovalData.ajax")
    @ResponseBody
    public List<ApprovalDocDTO> getApprovalData() {
        return apprservice.getApprovalData();
    }
	

    
}

