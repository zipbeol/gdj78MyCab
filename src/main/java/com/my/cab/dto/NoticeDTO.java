package com.my.cab.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("notice")
public class NoticeDTO {

	private int notice_idx;
	private int notice_writer;
	private String notice_field;
	private String notice_imp;
	private String notice_stat;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
	private String notice_writer_name; 
	private int emp_no;
	private String emp_name;
	private int notice_attach_file_idx;
	private String notice_file_name;
	private String notice_attach_file;
	public int getNotice_idx() {
		return notice_idx;
	}
	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}
	public int getNotice_writer() {
		return notice_writer;
	}
	public void setNotice_writer(int notice_writer) {
		this.notice_writer = notice_writer;
	}
	public String getNotice_field() {
		return notice_field;
	}
	public void setNotice_field(String notice_field) {
		this.notice_field = notice_field;
	}
	public String getNotice_imp() {
		return notice_imp;
	}
	public void setNotice_imp(String notice_imp) {
		this.notice_imp = notice_imp;
	}
	public String getNotice_stat() {
		return notice_stat;
	}
	public void setNotice_stat(String notice_stat) {
		this.notice_stat = notice_stat;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public int getNotice_attach_file_idx() {
		return notice_attach_file_idx;
	}
	public void setNotice_attach_file_idx(int notice_attach_file_idx) {
		this.notice_attach_file_idx = notice_attach_file_idx;
	}
	public String getNotice_file_name() {
		return notice_file_name;
	}
	public void setNotice_file_name(String notice_file_name) {
		this.notice_file_name = notice_file_name;
	}
	public String getNotice_attach_file() {
		return notice_attach_file;
	}
	public void setNotice_attach_file(String notice_attach_file) {
		this.notice_attach_file = notice_attach_file;
	}
	public String getNotice_writer_name() {
		return notice_writer_name;
	}
	public void setNotice_writer_name(String notice_writer_name) {
		this.notice_writer_name = notice_writer_name;
	}
  
	
	
	
}
