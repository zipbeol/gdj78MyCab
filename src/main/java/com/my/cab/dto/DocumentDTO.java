package com.my.cab.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias(value="DocumentDTO")
public class DocumentDTO {
    private int appr_file_idx; // 첨부파일번호
    private String appr_file_name; // 원본파일명
    private String appr_file_new_name; // 저장파일명
    private String appr_file_path; // 파일URL
    private Date appr_file_dt; // 저장일
    private int appr_file_type; // 파일 유형
    
    
    
	public int getAppr_file_type() {
		return appr_file_type;
	}
	public void setAppr_file_type(int appr_file_type) {
		this.appr_file_type = appr_file_type;
	}
	public int getAppr_file_idx() {
		return appr_file_idx;
	}
	public void setAppr_file_idx(int appr_file_idx) {
		this.appr_file_idx = appr_file_idx;
	}
	public String getAppr_file_name() {
		return appr_file_name;
	}
	public void setAppr_file_name(String appr_file_name) {
		this.appr_file_name = appr_file_name;
	}
	public String getAppr_file_new_name() {
		return appr_file_new_name;
	}
	public void setAppr_file_new_name(String appr_file_new_name) {
		this.appr_file_new_name = appr_file_new_name;
	}
	public String getAppr_file_path() {
		return appr_file_path;
	}
	public void setAppr_file_path(String appr_file_path) {
		this.appr_file_path = appr_file_path;
	}
	public Date getAppr_file_dt() {
		return appr_file_dt;
	}
    public void setAppr_file_dt(java.sql.Date appr_file_dt) {
        this.appr_file_dt = appr_file_dt;
    }
	@Override
	public String toString() {
		return "DocumentDTO [appr_file_idx=" + appr_file_idx + ", appr_file_name=" + appr_file_name
				+ ", appr_file_new_name=" + appr_file_new_name + ", appr_file_path=" + appr_file_path
				+ ", appr_file_dt=" + appr_file_dt + ", appr_file_type=" + appr_file_type + "]";
	}
    
}
