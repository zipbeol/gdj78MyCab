package com.my.cab.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias(value="ApprovalDoc")
public class ApprovalDocDTO {
    private int approval_doc_idx;
    private int approval_doc_type_item_idx;
    private int approval_doc_line_idx;
    private Long file_idx;
    private int emp_no;
    private Date approval_doc_write_date;
    private String approval_doc_assist_user;
    private String approval_doc_udt_id;
    private Date approval_doc_udt_dt;
    private int approval_doc__state;
    private String approval_doc_path;
    
    private String appr_file_path;
	
    public String getAppr_file_path() {
		return appr_file_path;
	}
	public void setAppr_file_path(String appr_file_path) {
		this.appr_file_path = appr_file_path;
	}
	public int getApproval_doc_idx() {
		return approval_doc_idx;
	}
	public void setApproval_doc_idx(int approval_doc_idx) {
		this.approval_doc_idx = approval_doc_idx;
	}
	public int getApproval_doc_type_item_idx() {
		return approval_doc_type_item_idx;
	}
	public void setApproval_doc_type_item_idx(int approval_doc_type_item_idx) {
		this.approval_doc_type_item_idx = approval_doc_type_item_idx;
	}
	public int getApproval_doc_line_idx() {
		return approval_doc_line_idx;
	}
	public void setApproval_doc_line_idx(int approval_doc_line_idx) {
		this.approval_doc_line_idx = approval_doc_line_idx;
	}
	public Long getFile_idx() {
		return file_idx;
	}
	public void setFile_idx(Long file_idx) {
		this.file_idx = file_idx;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public Date getApproval_doc_write_date() {
		return approval_doc_write_date;
	}
	public void setApproval_doc_write_date(Date approval_doc_write_date) {
		this.approval_doc_write_date = approval_doc_write_date;
	}
	public String getApproval_doc_assist_user() {
		return approval_doc_assist_user;
	}
	public void setApproval_doc_assist_user(String approval_doc_assist_user) {
		this.approval_doc_assist_user = approval_doc_assist_user;
	}
	public String getApproval_doc_udt_id() {
		return approval_doc_udt_id;
	}
	public void setApproval_doc_udt_id(String approval_doc_udt_id) {
		this.approval_doc_udt_id = approval_doc_udt_id;
	}
	public Date getApproval_doc_udt_dt() {
		return approval_doc_udt_dt;
	}
	public void setApproval_doc_udt_dt(Date approval_doc_udt_dt) {
		this.approval_doc_udt_dt = approval_doc_udt_dt;
	}
	public int getApproval_doc__state() {
		return approval_doc__state;
	}
	public void setApproval_doc__state(int approval_doc__state) {
		this.approval_doc__state = approval_doc__state;
	}
	public String getApproval_doc_path() {
		return approval_doc_path;
	}
	public void setApproval_doc_path(String approval_doc_path) {
		this.approval_doc_path = approval_doc_path;
	}
	@Override
	public String toString() {
		return "ApprovalDocDTO [approval_doc_idx=" + approval_doc_idx + ", approval_doc_type_item_idx="
				+ approval_doc_type_item_idx + ", approval_doc_line_idx=" + approval_doc_line_idx + ", file_idx="
				+ file_idx + ", emp_no=" + emp_no + ", approval_doc_write_date=" + approval_doc_write_date
				+ ", approval_doc_assist_user=" + approval_doc_assist_user + ", approval_doc_udt_id="
				+ approval_doc_udt_id + ", approval_doc_udt_dt=" + approval_doc_udt_dt + ", approval_doc__state="
				+ approval_doc__state + ", approval_doc_path=" + approval_doc_path + ", appr_file_path="
				+ appr_file_path + "]";
	}
    
	
}
