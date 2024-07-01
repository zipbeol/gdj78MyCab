package com.my.cab.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias(value="Approval")
public class ApprovalDTO {
	
    private int approval_doc_line_idx; // 결재라인번호
    private String appr_line_bkmk_idx; // 결재라인즐겨찾기번호
    private String appr_imgname; // 결재자 서명
    private String appr_comment; // 결재의견
    private Date appr_mngr_updt; // 결재일
    private String appr_decsion; // 전결
    private String appr_midapprover; // 중간결재자
    private String appr_finalapprover; // 최종결재자
    
    private int approval_doc_idx; // 결재 번호
    
    
    
    
    
	public int getApproval_doc_idx() {
		return approval_doc_idx;
	}
	public void setApproval_doc_idx(int approval_doc_idx) {
		this.approval_doc_idx = approval_doc_idx;
	}
	public int getApproval_doc_line_idx() {
		return approval_doc_line_idx;
	}
	public void setApproval_doc_line_idx(int approval_doc_line_idx) {
		this.approval_doc_line_idx = approval_doc_line_idx;
	}
	public String getAppr_line_bkmk_idx() {
		return appr_line_bkmk_idx;
	}
	public void setAppr_line_bkmk_idx(String approverLine) {
		this.appr_line_bkmk_idx = approverLine;
	}
	public String getAppr_imgname() {
		return appr_imgname;
	}
	public void setAppr_imgname(String appr_imgname) {
		this.appr_imgname = appr_imgname;
	}
	public String getAppr_comment() {
		return appr_comment;
	}
	public void setAppr_comment(String appr_comment) {
		this.appr_comment = appr_comment;
	}
	public Date getAppr_mngr_updt() {
		return appr_mngr_updt;
	}
	public void setAppr_mngr_updt(Date appr_mngr_updt) {
		this.appr_mngr_updt = appr_mngr_updt;
	}
	public String getAppr_decsion() {
		return appr_decsion;
	}
	public void setAppr_decsion(String appr_decsion) {
		this.appr_decsion = appr_decsion;
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
	@Override
	public String toString() {
		return "ApprovalDTO [approval_doc_line_idx=" + approval_doc_line_idx + ", appr_line_bkmk_idx="
				+ appr_line_bkmk_idx + ", appr_imgname=" + appr_imgname + ", appr_comment=" + appr_comment
				+ ", appr_mngr_updt=" + appr_mngr_updt + ", appr_decsion=" + appr_decsion + ", appr_midapprover="
				+ appr_midapprover + ", appr_finalapprover=" + appr_finalapprover + ", approval_doc_idx="
				+ approval_doc_idx + "]";
	}

    
}
