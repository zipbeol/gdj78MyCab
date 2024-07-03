package com.my.cab.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.my.cab.dao.NoticeDAO;
import com.my.cab.dto.NoticeDTO;
import com.my.cab.dto.SearchDTO;

@Service
public class NoticeService {

	Logger logger = LoggerFactory.getLogger(getClass());

	private static final int PAGE_SIZE = 10;

	@Value("${spring.servlet.multipart.location}")
	private String uploadDir;

	@Autowired
	NoticeDAO noticeDAO;

	public Map<String, Object> getNoticeList(Map<String, Object> param, SearchDTO searchDTO) {
		Map<String, Object> map = new HashMap<>();
		int page = (searchDTO.getPage() - 1) * PAGE_SIZE;
		searchDTO.setPage(page);
		searchDTO.setPageSize(PAGE_SIZE);

		List<NoticeDTO> noticeList = noticeDAO.getNoticeList(searchDTO);
		map.put("notice", noticeList);

		return map;
	}
	@Transactional
	public void inactivateNotices(List<Integer> noticeIds) {
	    for (int noticeId : noticeIds) {
	        noticeDAO.inactivateNotice(noticeId);
	    }
	}
	@Transactional
	public int registerNotice(NoticeDTO noticeDTO) {
		// 중요 공지 등록 전 개수 확인
		if ("true".equals(noticeDTO.getNotice_imp()) && noticeDAO.countImportantNotices() >= 3) {
			return -1; // 중요 공지가 3개 이상인 경우
		}

		noticeDAO.insertNotice(noticeDTO);
		return noticeDTO.getNotice_idx();
	}

	public void uploadAttachment(NoticeDTO noticeDTO, MultipartFile file) throws IOException {

		// 이름 바꾸는거
		String uploadFileName = "notice_" + noticeDTO.getNotice_idx() + "_" + System.currentTimeMillis()
		+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		// 첨부 파일 업로드
		if (!file.isEmpty()) {
			byte[] bytes = file.getBytes();
			Path filePath = Paths.get(uploadDir + "/" + uploadFileName);
			Files.write(filePath, bytes);
			noticeDTO.setNotice_file_name(file.getOriginalFilename());
			noticeDTO.setNotice_attach_file(filePath.toString());
			noticeDAO.insertAttachment(noticeDTO);
		}
	}
	public Object getNoticeTotalPages(SearchDTO searchDTO) {
		int profitTotal = noticeDAO.getNoticeCount(searchDTO);
		int totalPages = (int) Math.ceil((double) profitTotal / PAGE_SIZE);
		return totalPages = totalPages > 0 ? totalPages : 1;
	}

}
