package com.my.cab.dto;


import java.sql.Date;
import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("att")
public class AttendanceDTO {
	
	private String attendance_idx;
	private int emp_no;
	private Timestamp  att_time;
	private Timestamp leave_time;
	private String att_result;
	private Date work_day;
	public String getAttendance_idx() {
		return attendance_idx;
	}
	public void setAttendance_idx(String attendance_idx) {
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
	
	
	
	
	

}
