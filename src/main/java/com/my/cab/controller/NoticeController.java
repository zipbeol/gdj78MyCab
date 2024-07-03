package com.my.cab.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.my.cab.dto.NoticeDTO;
import com.my.cab.dto.SearchDTO;
import com.my.cab.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	NoticeService noticeService;

	@RequestMapping("/list")
	public String noticeList(Model model) {
		logger.info("공지사항 리스트");

		return "notice/noticeList";
	}

	@PostMapping("/list.ajax")
	@ResponseBody
	public Map<String, Object> getNoticeList(@RequestParam Map<String, Object> param) {
		SearchDTO searchDTO = new SearchDTO();
		searchDTO.setCategory((String) param.get("category"));
		searchDTO.setFilterStartDate((String) param.get("filterStartDate"));
		searchDTO.setFilterEndDate((String) param.get("filterEndDate"));
		searchDTO.setNoticeWriter((String) param.get("noticeWriter"));
		searchDTO.setNoticeTitle((String) param.get("noticeTitle"));
		searchDTO.setPage(Integer.parseInt((String) param.get("page")));
		logger.info("공지사항 리스트 - AJAX 요청");
		return noticeService.getNoticeList(param, searchDTO);
	}

	@RequestMapping("/register.go")
	public String noticeRegister(Model model) {
		logger.info("공지사항 작성");

		return "notice/noticeRegister";
	}

	@PostMapping("/register.ajax")
	@ResponseBody
	public Map<String, Object> registerNotice(NoticeDTO noticeDTO,
			@RequestParam(value = "fileAttachment", required = false) MultipartFile[] files) throws IOException {
		logger.info("공지사항 작성페이지 - AJAX 요청");
		logger.info("DTO" + noticeDTO.getNotice_title());
		logger.info("DTO" + noticeDTO.getNotice_field());
		logger.info("DTO" + noticeDTO.getNotice_content());
		logger.info("DTO" + noticeDTO.getNotice_imp());

		Map<String, Object> response = new HashMap<>();
		int result = noticeService.registerNotice(noticeDTO);

		if (result == -1) {
			response.put("status", "error");
			response.put("message", "중요 공지는 최대 3개까지만 등록할 수 있습니다.");
			return response;
		}
		if (files != null) {
			for (MultipartFile file : files) {
				logger.info("fileName:{}", file.getOriginalFilename());
				if (!file.isEmpty()) {
					noticeService.uploadAttachment(noticeDTO, file);
					try {
						Thread.sleep(1);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
			}
		}
		response.put("status", "success");
		response.put("message", "등록이 성공적으로 완료되었습니다.");
		return response;
	}

	@PostMapping("/inactivate.ajax")
	@ResponseBody
	public Map<String, Object> inactivateNotices(@RequestBody List<Integer> noticeIds) {
		Map<String, Object> response = new HashMap<>();
		try {
			noticeService.inactivateNotices(noticeIds);
			response.put("status", "success");
		} catch (Exception e) {
			response.put("status", "error");
			response.put("message", "비활성화에 실패 하였습니다.");
		}
		return response;

	}

	// 공지 페이징 처리
	@GetMapping("/getTotalPages.ajax")
	@ResponseBody
	public Map<String, Object> getProTotalPages(SearchDTO searchDTO) {
		logger.info("\nsearchDTO SearchText:" + searchDTO.getSearchText() + "\nsearchDTO Category:"
				+ searchDTO.getCategory() + "\nsearchDTO filterStartDate:" + searchDTO.getFilterStartDate()
				+ "\nsearchDTO filterEndDate:" + searchDTO.getFilterEndDate() + "\nsearchDTO page:"
				+ searchDTO.getPage());
		logger.info("searchDTO = " + searchDTO);
		Map<String, Object> map = new HashMap<>();
		map.put("totalPages", noticeService.getNoticeTotalPages(searchDTO));

		return map;
	}

}
