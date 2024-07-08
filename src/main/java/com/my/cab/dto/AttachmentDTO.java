package com.my.cab.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("attachment")
public class AttachmentDTO {
    private Integer fileIdx;
    private String fileName;
    private String fileType;
    private String fileSize;
    private MultipartFile file;
    private Integer chatIdx;
    private String oriFileName;

    public String getOriFileName() {
        return oriFileName;
    }

    public void setOriFileName(String oriFileName) {
        this.oriFileName = oriFileName;
    }

    public Integer getChatIdx() {
        return chatIdx;
    }

    public void setChatIdx(Integer chatIdx) {
        this.chatIdx = chatIdx;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public Integer getFileIdx() {
        return fileIdx;
    }

    public void setFileIdx(Integer fileIdx) {
        this.fileIdx = fileIdx;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    public String getFileSize() {
        return fileSize;
    }

    public void setFileSize(String fileSize) {
        this.fileSize = fileSize;
    }
}
