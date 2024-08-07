package com.my.cab.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias(value="ApprovalDoc")
public class ApprovalDocDTO {
	
    private int approval_doc_idx; // 결재번호
    private String approval_doc_id; // 기안자 ID
    private String approval_doc_title; // 제목
    private String approval_doc_write_date; // 작성일
    private String approval_doc_assist_user; // 참조자
    private String approval_doc_udt_id; // 수정자
    private Date approval_doc_udt_dt; // 수정일
    private String approval_doc_path; // 문서파일경로
    private int approval_doc__state; // 결재상태
    private boolean approval_doc_isFinal; // 최종결재여부
    
    private String appr_midapprover; // 중간결재자
    private String appr_finalapprover; // 최종결재자
    private Date appr_mngr_updt; // 결재일
    
	private int dept_no; // 부서 넘버
	private int title_no; // 직책 넘버
	private String emp_name; // 사원 이름

	
	private String dept_name; // 부서 이름
	private String title_name; // 직책 이름
    
    
	
    public int getDept_no() {
		return dept_no;
	}
	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}
	public int getTitle_no() {
		return title_no;
	}
	public void setTitle_no(int title_no) {
		this.title_no = title_no;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getTitle_name() {
		return title_name;
	}
	public void setTitle_name(String title_name) {
		this.title_name = title_name;
	}
	public Date getAppr_mngr_updt() {
		return appr_mngr_updt;
	}
	public void setAppr_mngr_updt(Date appr_mngr_updt) {
		this.appr_mngr_updt = appr_mngr_updt;
	}
	public String getAppr_midapprover() {
		return appr_midapprover;
	}
	public void setAppr_midapprover(String appr_midapprover) {
		this.appr_midapprover = appr_midapprover;
	}
	public String getAppr_finalapprover() {
		return appr_finalapprover;
	}
	public void setAppr_finalapprover(String appr_finalapprover) {
		this.appr_finalapprover = appr_finalapprover;
	}
	public String getApproval_doc_id() {
		return approval_doc_id;
	}
	public void setApproval_doc_id(String drafterId) {
		this.approval_doc_id = drafterId;
	}
	public int getApproval_doc_idx() {
		return approval_doc_idx;
	}
	public void setApproval_doc_idx(int approval_doc_idx) {
		this.approval_doc_idx = approval_doc_idx;
	}
	public String getApproval_doc_title() {
		return approval_doc_title;
	}
	public void setApproval_doc_title(String approval_doc_title) {
		this.approval_doc_title = approval_doc_title;
	}
	public String getApproval_doc_write_date() {
		return approval_doc_write_date;
	}
	public void setApproval_doc_write_date(String date) {
		this.approval_doc_write_date = date;
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
	public String getApproval_doc_path() {
		return approval_doc_path;
	}
	public void setApproval_doc_path(String approval_doc_path) {
		this.approval_doc_path = approval_doc_path;
	}
	public int getApproval_doc__state() {
		return approval_doc__state;
	}
	public void setApproval_doc__state(int approval_doc__state) {
		this.approval_doc__state = approval_doc__state;
	}
	public boolean getApproval_doc_isFinal() {
		return approval_doc_isFinal;
	}
	public void setApproval_doc_isFinal(boolean isFinal) {
		this.approval_doc_isFinal = isFinal;
	}
	
	@Override
	public String toString() {
		return "ApprovalDocDTO [approval_doc_idx=" + approval_doc_idx + ", approval_doc_id=" + approval_doc_id
				+ ", approval_doc_title=" + approval_doc_title + ", approval_doc_write_date=" + approval_doc_write_date
				+ ", approval_doc_assist_user=" + approval_doc_assist_user + ", approval_doc_udt_id="
				+ approval_doc_udt_id + ", approval_doc_udt_dt=" + approval_doc_udt_dt + ", approval_doc_path="
				+ approval_doc_path + ", approval_doc__state=" + approval_doc__state + ", approval_doc_isFinal="
				+ approval_doc_isFinal + ", appr_midapprover=" + appr_midapprover + ", appr_finalapprover="
				+ appr_finalapprover + ", appr_mngr_updt=" + appr_mngr_updt + ", dept_no=" + dept_no + ", title_no="
				+ title_no + ", emp_name=" + emp_name + ", dept_name=" + dept_name + ", title_name=" + title_name + "]";
	}


	
}
