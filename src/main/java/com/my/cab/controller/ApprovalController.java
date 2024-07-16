package com.my.cab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.HashMap;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	// 파일 저장 디렉토리 설정 시작
	
	// 결재문서 저장 디렉토리
    private static final String APPROVAL_UPLOAD_DIR = "/usr/local/tomcat/webapps/upload/startApprover";
    // 서명 이미지 저장 디렉토리
    private static final String SIGNATURE_UPLOAD_DIR = "/usr/local/tomcat/webapps/upload/signatures";
    // 첨부파일 저장 디렉토리
    private static final String DOC_FILE_UPLOAD_DIR = "/usr/local/tomcat/webapps/upload/doc_file";

    // 애플리케이션 시작 시 디렉토리 생성
    static {
        File approvalDir = new File(APPROVAL_UPLOAD_DIR);
        if (!approvalDir.exists()) {
            approvalDir.mkdirs();
        }
        File signatureDir = new File(SIGNATURE_UPLOAD_DIR);
        if (!signatureDir.exists()) {
            signatureDir.mkdirs();
        }
        File docFileDir = new File(DOC_FILE_UPLOAD_DIR);
        if (!docFileDir.exists()) {
            docFileDir.mkdirs();
        }
    }
    
    // 파일 저장 디렉토리 설정 종료
    
    // 기안서 작성 페이지 시작
	
    // 기안서 작성 페이징 이동 요청
	@RequestMapping(value="/approval/approvalWriteForm.go") // value 수정
	public String approvalWriteForm() {
		logger.info("기안서 작성 페이지 이동");	
		return "approval/approvalWriteForm";
	}
	
	// 기안서 데이터 DB 저장
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
            // HTML 내용 저장
            String timeStamp = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date(System.currentTimeMillis()));
            String fileName = "approval_file_" + timeStamp + ".html";
            String filePath = APPROVAL_UPLOAD_DIR + File.separator + fileName;

            String drafterId = (String) session.getAttribute("loginId");
            logger.info("아이디 추가 확인 : " + drafterId);

            // HTML 파일 생성 및 저장
            File htmlFile = new File(filePath);
            try (FileOutputStream fos = new FileOutputStream(htmlFile)) {
                fos.write(htmlContent.getBytes());
            }

            // 수정한 HTML의 파일 경로를 데이터베이스에 저장
            ApprovalDocDTO approvalDoc = new ApprovalDocDTO();
            approvalDoc.setApproval_doc_path(filePath);
            approvalDoc.setApproval_doc_write_date(date);
            approvalDoc.setApproval_doc_title(title);
            approvalDoc.setApproval_doc_assist_user(participator);
            approvalDoc.setApproval_doc_isFinal(isFinal);
            approvalDoc.setApproval_doc_id(drafterId);
            apprservice.saveApprovalDoc(approvalDoc);

            // 첨부 파일 저장
            if (file != null && !file.isEmpty()) {
                String originalFilename = file.getOriginalFilename();
                String uploadFilePath = DOC_FILE_UPLOAD_DIR + File.separator + originalFilename;
                File uploadedFile = new File(uploadFilePath);
                file.transferTo(uploadedFile);
                logger.info("Uploaded file saved at: " + uploadFilePath);

                // 첨부 파일 경로를 데이터베이스에 저장
                DocumentDTO docItemFileDTO = new DocumentDTO();
                docItemFileDTO.setAppr_file_path(uploadFilePath);
                apprservice.saveAttachedFilePath(uploadFilePath);
            }

            // 결재라인 등 데이터베이스에 저장
            ApprovalDTO approval = new ApprovalDTO();
            approval.setApproval_doc_idx(approvalDoc.getApproval_doc_idx());
            approval.setAppr_line_bkmk_idx(approverLine);
            approval.setAppr_midapprover(midApprover);
            approval.setAppr_finalapprover(finalApprover);
            apprservice.saveApproval(approval);

            model.addAttribute("message", "File saved successfully: " + fileName);
            return "success";
        } catch (Exception e) {
            logger.error("Error saving file", e);
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
	
	// 기안서 작성 페이지 종료
	
	// 내 결재 페이지 시작
	
	// 내 결재 관리 결재문서 리스트 조회 ( 페이징, 필터링, 검색 )
	@PostMapping("/getApprovalData.ajax")
	@ResponseBody
	public Map<String, Object> getApprovalData(
	        HttpSession session,
	        @RequestParam(value = "page", defaultValue = "1") int page,
	        @RequestParam(value = "query", defaultValue = "") String query,
	        @RequestParam(value = "status", defaultValue = "") String status) {
	    
	    String loginId = (String) session.getAttribute("loginId");
	    int pageSize = 5;
	    int start = (page - 1) * pageSize;

	    Map<String, Object> params = new HashMap<>();
	    params.put("loginId", loginId);
	    params.put("start", start);
	    params.put("pageSize", pageSize);
	    params.put("query", query);
	    params.put("status", status);

	    List<ApprovalDocDTO> data = apprservice.getFilteredApprovalData(params);
	    int total = apprservice.getApprovalDocCount(params);

	    Map<String, Object> result = new HashMap<>();
	    result.put("data", data);
	    result.put("totalPages", (int) Math.ceil((double) total / pageSize));

	    return result;
	}
    
    // 기안서 결재 페이지 불러오기
    @GetMapping("/approval/viewFile/{encodedFilename}/{approval_doc_idx}")
    public String viewFile(HttpSession session, @PathVariable String encodedFilename, Model model
    		, @PathVariable String approval_doc_idx) {
        try {
        	session.setAttribute("approval_doc_idx", approval_doc_idx);
            String filename = new String(Base64.getDecoder().decode(encodedFilename));
            Path file = Paths.get("/usr/local/tomcat/webapps/upload").resolve(filename).normalize();
            System.out.println("Serving file: " + file.toString()); // 디버깅용 출력

            if (Files.exists(file) && Files.isReadable(file)) {
                byte[] fileContent = Files.readAllBytes(file);
                String encodedString = Base64.getEncoder().encodeToString(fileContent);
                model.addAttribute("fileContent", filename.substring(filename.indexOf("\\") + 1, filename.length()));
                return "approval/viewFile";
            } else {
                model.addAttribute("errorMessage", "파일을 읽을 수 없습니다.");
                return "approval/error";
            }
        } catch (Exception e) {
            model.addAttribute("errorMessage", "파일을 읽는 중 오류가 발생했습니다.");
            return "approval/error";
        }
    }
    
  //서명 이미지 업로드 처리
    @PostMapping("/uploadSignature")
    @ResponseBody
    public String uploadSignature(@RequestBody Map<String, String> requestBody, HttpSession session) {
        try {
            // 이미지 데이터와 로그인 ID를 받아옴
            String imageData = requestBody.get("image");
            String loginId = requestBody.get("loginId");
            byte[] imageBytes = Base64.getDecoder().decode(imageData.split(",")[1]);
            String fileName = "signature_" + loginId + ".png";
            String filePath = SIGNATURE_UPLOAD_DIR + File.separator + fileName;

            // 이미지 파일 생성 및 저장
            try (FileOutputStream fos = new FileOutputStream(filePath)) {
                fos.write(imageBytes);
            }

            // DB에 이미지 경로 저장
            DocumentDTO document = new DocumentDTO();
            document.setAppr_file_name(fileName);
            document.setAppr_file_path(filePath);
            document.setAppr_file_type(2); // 파일 유형 2로 설정

            // 기존 서명 이미지가 있는지 확인 후 업데이트 또는 저장
            if (apprservice.isSignatureExist(fileName)) {
                apprservice.updateSignature(document);
            } else {
                apprservice.saveSignature(document);
            }

            return "서명이 저장되었습니다.";
        } catch (Exception e) {
            logger.error("서명 저장 중 오류 발생", e);
            return "서명 저장 중 오류 발생: " + e.getMessage();
        }
    }

    // 서명 이미지 조회 처리
    @GetMapping("/getSignature")
    @ResponseBody
    public String getSignature(HttpSession session) {
        String loginId = (String) session.getAttribute("loginId");
        String fileName = "signature_" + loginId + ".png";
        String filePath = apprservice.getSignaturePath(fileName);

        if (filePath != null) {
            File file = new File(filePath);
            if (file.exists()) {
                try {
                    // 파일을 읽어 Base64로 인코딩하여 반환
                    byte[] imageBytes = Files.readAllBytes(file.toPath());
                    return Base64.getEncoder().encodeToString(imageBytes);
                } catch (Exception e) {
                    logger.error("서명 이미지 로드 중 오류 발생", e);
                }
            }
        }
        return null;
    }
    
    @GetMapping("/getUserType")
    @ResponseBody
    public String getUserType(HttpSession session) {
        String loginId = (String) session.getAttribute("loginId");
        String approval_doc_idx = (String) session.getAttribute("approval_doc_idx");
        logger.info("approval_doc_idx : {}", approval_doc_idx);
        if (loginId == null) {
            return "로그인 정보가 없습니다.";
        }
        
        try {
            // 로그인된 사용자의 이름과 직책을 가져옵니다.
            String userName = apprservice.getUserNameById(loginId);
            String userTitle = apprservice.getUserTitleById(loginId);

            Map<String, Object> params = new HashMap<>();
            params.put("userName", userName);
            params.put("userTitle", userTitle);

            // 결재자 유형 확인
            String userType = apprservice.getUserType(params);
            if (userType == null) {
                return "결재자 유형을 찾을 수 없습니다.";
            }
            return userType;
        } catch (Exception e) {
            e.printStackTrace();
            return "서버 오류가 발생했습니다.";
        }
    }
    
    // 결재 상태 업데이트 요청 처리
    @PostMapping("/updateApprovalStatus")
    @ResponseBody
    public String updateApprovalStatus(HttpSession session ,@RequestBody Map<String, Object> requestBody) {
        String approvalDocIdx = (String) session.getAttribute("approval_doc_idx");
        String userType = (String) requestBody.get("userType");
        String approvalDate = (String) requestBody.get("approvalDate");
        
        int approvalState = 0;
        if ("midApprover".equals(userType)) {
            approvalState = 1;
        } else if ("finalApprover".equals(userType)) {
            approvalState = 2;
        }

        boolean success = apprservice.updateApprovalStatus(approvalDocIdx, approvalState, approvalDate);
        return success ? "success" : "error";
    }
    
    // 내 결재 페이지 종료
    
    // 결재 통합 관리 페이지 시작 //
    
    // 결재 통합 관리 페이징 이동 요청
	@RequestMapping(value="/approval/approvalIntegration.go") // value 수정
	public String approvalIntegration() {
		logger.info("결재 통합 관리 페이지 이동");	
		return "approval/approvalIntegration";
	}
	
	// 결재 통합 관리 결재 문서 전체 리스트업 ( 페이징, 필터링, 검색 )
	@PostMapping("/getApprovalDocData.ajax")
	@ResponseBody
	public Map<String, Object> getApprovalDocData(
	        @RequestParam(value = "page", defaultValue = "1") int page,
	        @RequestParam(value = "query", defaultValue = "") String query,
	        @RequestParam(value = "status", defaultValue = "") String status) {

	    int pageSize = 5;
	    int start = (page - 1) * pageSize;

	    Map<String, Object> params = new HashMap<>();
	    params.put("start", start);
	    params.put("pageSize", pageSize);
	    params.put("query", query);
	    params.put("status", status);

	    List<ApprovalDocDTO> data = apprservice.getAllApprovalDocData(params);
	    int total = apprservice.getAllApprovalDocCount(params);

	    Map<String, Object> result = new HashMap<>();
	    result.put("data", data);
	    result.put("totalPages", (int) Math.ceil((double) total / pageSize));

	    return result;
	}
	
    // 결재 문서 삭제 기능
    @PostMapping("/deleteApprovalDocs.ajax")
    @ResponseBody
    public Map<String, Object> deleteApprovalDocs(@RequestBody List<String> docs) {
        boolean success = apprservice.deleteApprovalDocs(docs);

        Map<String, Object> result = new HashMap<>();
        result.put("success", success);
        return result;
    }
    
    
    
    
 // 결재 통합 관리 페이지 종료 //
}
	

