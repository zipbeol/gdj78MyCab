package com.my.cab.dto;

import java.security.Timestamp;
import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias(value="ApprovalLineList")
public class ApprovalLineListDTO {
	
	private int appr_line_bkmk_idx;
	private String appr_line_bkmk_name;
	private String appr_midapprover;
	private String appr_finalapprover;
	private Date appr_line_bkmk_create_dt;
	private Date appr_line_bkmk_udt_dt;
	public int getAppr_line_bkmk_idx() {
		return appr_line_bkmk_idx;
	}
	public void setAppr_line_bkmk_idx(int appr_line_bkmk_idx) {
		this.appr_line_bkmk_idx = appr_line_bkmk_idx;
	}
	public String getAppr_line_bkmk_name() {
		return appr_line_bkmk_name;
	}
	public void setAppr_line_bkmk_name(String appr_line_bkmk_name) {
		this.appr_line_bkmk_name = appr_line_bkmk_name;
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
	public Date getAppr_line_bkmk_create_dt() {
		return appr_line_bkmk_create_dt;
	}
	public void setAppr_line_bkmk_create_dt(Date appr_line_bkmk_create_dt) {
		this.appr_line_bkmk_create_dt = appr_line_bkmk_create_dt;
	}
	public Date getAppr_line_bkmk_udt_dt() {
		return appr_line_bkmk_udt_dt;
	}
	public void setAppr_line_bkmk_udt_dt(Date appr_line_bkmk_udt_dt) {
		this.appr_line_bkmk_udt_dt = appr_line_bkmk_udt_dt;
	}
	
	@Override
	public String toString() {
		return "ApprovalLineListDTO [appr_line_bkmk_idx=" + appr_line_bkmk_idx + ", appr_line_bkmk_name="
				+ appr_line_bkmk_name + ", appr_midapprover=" + appr_midapprover + ", appr_finalapprover="
				+ appr_finalapprover + ", appr_line_bkmk_create_dt=" + appr_line_bkmk_create_dt
				+ ", appr_line_bkmk_udt_dt=" + appr_line_bkmk_udt_dt + "]";
	}
	
	
	
	
}
