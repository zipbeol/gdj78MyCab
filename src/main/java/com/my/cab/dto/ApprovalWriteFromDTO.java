package com.my.cab.dto;

import java.security.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias(value="ApprovalWriteFrom")
public class ApprovalWriteFromDTO {
	
	private String approval_doc_type_item_idx;
	private String approval_doc_type_item_name;
	private String approval_doc_type_item_type;
	private Timestamp approval_doc_type_item_creat_dt;
	private Timestamp approval_doc_type_item_udt_dt;
	
	public String getApproval_doc_type_item_idx() {
		return approval_doc_type_item_idx;
	}
	public void setApproval_doc_type_item_idx(String approval_doc_type_item_idx) {
		this.approval_doc_type_item_idx = approval_doc_type_item_idx;
	}
	public String getApproval_doc_type_item_name() {
		return approval_doc_type_item_name;
	}
	public void setApproval_doc_type_item_name(String approval_doc_type_item_name) {
		this.approval_doc_type_item_name = approval_doc_type_item_name;
	}
	public String getApproval_doc_type_item_type() {
		return approval_doc_type_item_type;
	}
	public void setApproval_doc_type_item_type(String approval_doc_type_item_type) {
		this.approval_doc_type_item_type = approval_doc_type_item_type;
	}
	public Timestamp getApproval_doc_type_item_creat_dt() {
		return approval_doc_type_item_creat_dt;
	}
	public void setApproval_doc_type_item_creat_dt(Timestamp approval_doc_type_item_creat_dt) {
		this.approval_doc_type_item_creat_dt = approval_doc_type_item_creat_dt;
	}
	public Timestamp getApproval_doc_type_item_udt_dt() {
		return approval_doc_type_item_udt_dt;
	}
	public void setApproval_doc_type_item_udt_dt(Timestamp approval_doc_type_item_udt_dt) {
		this.approval_doc_type_item_udt_dt = approval_doc_type_item_udt_dt;
	}
	
	@Override
	public String toString() {
		return "ApprovalWriteFromDTO [approval_doc_type_item_idx=" + approval_doc_type_item_idx
				+ ", approval_doc_type_item_name=" + approval_doc_type_item_name + ", approval_doc_type_item_type="
				+ approval_doc_type_item_type + ", approval_doc_type_item_creat_dt=" + approval_doc_type_item_creat_dt
				+ ", approval_doc_type_item_udt_dt=" + approval_doc_type_item_udt_dt + "]";
	}
	
	
	
}
