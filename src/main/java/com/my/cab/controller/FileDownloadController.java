package com.my.cab.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@RestController
@RequestMapping("/api")
public class FileDownloadController {

    private final Path fileStorageLocation = Paths.get("src/main/resources/static/upload").toAbsolutePath().normalize();
    Logger logger = LoggerFactory.getLogger(FileDownloadController.class);
    
    @Value("${spring.servlet.multipart.location}")
    private String uploadDir;

    @GetMapping("/download/{fileName}")
    public ResponseEntity<Resource> downloadFile(@PathVariable String fileName) {
        logger.info(fileName);

        try {
            Path filePath = fileStorageLocation.resolve(fileName).normalize();
            Resource resource = new UrlResource(filePath.toUri());

            if (resource.exists() || resource.isReadable()) {
                return ResponseEntity.ok()
                        .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
                        .body(resource);
            } else {
                throw new RuntimeException("File not found " + fileName);
            }
        } catch (MalformedURLException e) {
            throw new RuntimeException("Error: " + e.getMessage());
        }
    }
    
    // 대현, 정원
    @GetMapping("/document/{filePath}")
    public ResponseEntity<Resource> loadDocument(@PathVariable String filePath) {
        logger.info(filePath);
        Resource resource = new FileSystemResource(uploadDir + "/startApprover/" +filePath);
        // 2. 보내질 파일의 형태를 지정해준다
        // 헤더에 보내질 파일의 형태를 지정해준다
        HttpHeaders header = new HttpHeaders();

        try {          
           String type = Files.probeContentType(Paths.get(uploadDir + "/startApprover/" + filePath)); // 경로를 주면 해당 파일의 mime-type 을 알아낸다
           header.add("content-type", type);
         } catch (IOException e) {
            e.getStackTrace();
         }
         // 클라이언트에게 보낼 내용(데이터), 헤더, 상태(200 또는 HttpStatus.OK 는 정상이라는 의미이다)
        return new ResponseEntity<Resource>(resource, header, HttpStatus.OK);
    }
}

