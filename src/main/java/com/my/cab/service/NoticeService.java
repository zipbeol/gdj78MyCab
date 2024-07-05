package com.my.cab.service;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
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
			Path filePath = Paths.get(uploadFileName);
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

	public NoticeDTO fileList(String notice_idx) {
		NoticeDTO filename = noticeDAO.getDetail(notice_idx);
		return filename;
	}
	
	public ResponseEntity<Resource> imgView(String fileName) {
		// 특정 경로에서 파일을 읽어와 Resource 로 만든다.
		logger.info("15616516165 "+fileName);
		Resource resource = new FileSystemResource(fileName);
		HttpHeaders header = new HttpHeaders();
		
		// 보내질 파일의 형태를 지정해 준다.(헤더에)
		// 예: image/gif, image/png, image/jpg, image/jpeg
		try {
			String type = Files.probeContentType(Paths.get(fileName));// 경로를 주면 해당 파일의 mime-type 을 알아낸다.
			logger.info("mime-type : "+type);
			logger.info(fileName);
			header.add("content-type", type);
		} catch (IOException e) {
			e.printStackTrace();
		} 
		//보낼 내용, 헤더, 상태(200 또는 HttpStatus.OK 는 정상이라는 뜻)		
		return new ResponseEntity<Resource>(resource,header,HttpStatus.OK);
	}
	
	public ResponseEntity<Resource> download(String fileName) {
		String[] names = fileName.split("\"");
		String name = names[names.length-1];
		logger.info(name);
		// 특정 경로에서 파일을 읽어와 Resource 로 만든다.
		Resource resource = new FileSystemResource(fileName);
		
		logger.info(fileName);
		HttpHeaders header = new HttpHeaders();
		

		try {
			// image/...  는 이미지, text/... 는 문자열, application/octet-stream 는 바이너리
			header.add("content-type", "application/octet-stream");//content-type
			// 보낼 파일 이름
			// content-Disposition 는 내다 보내려는 컨텐트의 형태를 의미 한다. inline 이면 문자열, attachment 는 다운로드 파일을 의미
			// attachment;filename="fileName.jpg"
			// 이때 파일명이 한글일 경우 깨져서 다운로드 된다. 그래서 안전하게 인코딩 해 준다.
			String oriFile = URLEncoder.encode(fileName, "UTF-8");
			header.add("content-Disposition", "attachment;filename=\""+oriFile+"\"");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		//보낼 내용, 헤더, 상태(200 또는 HttpStatus.OK 는 정상이라는 뜻)		
		return new ResponseEntity<Resource>(resource,header,HttpStatus.OK);
	}
	
	public List<NoticeDTO> getDetail(String notice_idx) {
		return noticeDAO.getList(notice_idx);
	}

}
