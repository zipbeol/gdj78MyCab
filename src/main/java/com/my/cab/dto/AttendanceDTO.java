package com.my.cab.dto;


import java.sql.Date;
import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("att")
public class AttendanceDTO {
	
	private int attendance_idx;
	private int emp_no;
	private Timestamp  att_time;
	private Timestamp leave_time;
	private String att_result;
	private Date work_day;
	private String attendance_management;
	private int att_applicant;
	private String att_modify_attresult;
	private String att_reason;
	private Timestamp att_applicant_date;
	private int att_modifier;
	private Timestamp att_modify_date;
	private String att_modify_reject;
	private boolean att_apply_status;
	private String emp_name;
	private String att_previous_attresult;
	private int att_management_idx;
	private String title_name;
	private String dept_name;
	private int absentCount;
    private int lateCount;
    private int leaveCount;
    private String process_status;
    
    
    public String getProcess_status() {
		return process_status;
	}

	public void setProcess_status(String process_status) {
		this.process_status = process_status;
	}

	
	
	public int getAbsentCount() {
		return absentCount;
	}
	public void setAbsentCount(int absentCount) {
		this.absentCount = absentCount;
	}
	public int getLateCount() {
		return lateCount;
	}
	public void setLateCount(int lateCount) {
		this.lateCount = lateCount;
	}
	public int getLeaveCount() {
		return leaveCount;
	}
	public void setLeaveCount(int leaveCount) {
		this.leaveCount = leaveCount;
	}
	public String getTitle_name() {
		return title_name;
	}
	public void setTitle_name(String title_name) {
		this.title_name = title_name;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public int getAtt_management_idx() {
		return att_management_idx;
	}
	public void setAtt_management_idx(int att_management_idx) {
		this.att_management_idx = att_management_idx;
	}
	public int getAttendance_idx() {
		return attendance_idx;
	}
	public void setAttendance_idx(int attendance_idx) {
		this.attendance_idx = attendance_idx;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public Timestamp getAtt_time() {
		return att_time;
	}
	public void setAtt_time(Timestamp att_time) {
		this.att_time = att_time;
	}
	public Timestamp getLeave_time() {
		return leave_time;
	}
	public void setLeave_time(Timestamp leave_time) {
		this.leave_time = leave_time;
	}
	public String getAtt_result() {
		return att_result;
	}
	public void setAtt_result(String att_result) {
		this.att_result = att_result;
	}
	public Date getWork_day() {
		return work_day;
	}
	public void setWork_day(Date work_day) {
		this.work_day = work_day;
	}
	public String getAttendance_management() {
		return attendance_management;
	}
	public void setAttendance_management(String attendance_management) {
		this.attendance_management = attendance_management;
	}
	public int getAtt_applicant() {
		return att_applicant;
	}
	public void setAtt_applicant(int att_applicant) {
		this.att_applicant = att_applicant;
	}
	public String getAtt_modify_attresult() {
		return att_modify_attresult;
	}
	public void setAtt_modify_attresult(String att_modify_attresult) {
		this.att_modify_attresult = att_modify_attresult;
	}
	public String getAtt_reason() {
		return att_reason;
	}
	public void setAtt_reason(String att_reason) {
		this.att_reason = att_reason;
	}
	public Timestamp getAtt_applicant_date() {
		return att_applicant_date;
	}
	public void setAtt_applicant_date(Timestamp att_applicant_date) {
		this.att_applicant_date = att_applicant_date;
	}
	public int getAtt_modifier() {
		return att_modifier;
	}
	public void setAtt_modifier(int att_modifier) {
		this.att_modifier = att_modifier;
	}
	public Timestamp getAtt_modify_date() {
		return att_modify_date;
	}
	public void setAtt_modify_date(Timestamp att_modify_date) {
		this.att_modify_date = att_modify_date;
	}
	public String getAtt_modify_reject() {
		return att_modify_reject;
	}
	public void setAtt_modify_reject(String att_modify_reject) {
		this.att_modify_reject = att_modify_reject;
	}
	public boolean isAtt_apply_status() {
		return att_apply_status;
	}
	public void setAtt_apply_status(boolean att_apply_status) {
		this.att_apply_status = att_apply_status;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getAtt_previous_attresult() {
		return att_previous_attresult;
	}
	public void setAtt_previous_attresult(String att_previous_attresult) {
		this.att_previous_attresult = att_previous_attresult;
	}
	
	
	
	
	

}
