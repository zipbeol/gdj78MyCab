package com.my.cab.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("calendarDTO")
public class CalendarDTO {
	private int schedule_idx;
	private String schedule_name;
	private String schedule_content;
	private Date schedule_start_date;
	private Date schedule_end_date;
	private Date schedule_register_date;
	private int schedule_emp_no;
	private int schedule_editor;
	private String schedule_category;
	private Date schedule_edit_date;
	private boolean schedule_del;
	private String schedule_color;
	
	
	public int getSchedule_idx() {
		return schedule_idx;
	}
	public void setSchedule_idx(int schedule_idx) {
		this.schedule_idx = schedule_idx;
	}
	public String getSchedule_name() {
		return schedule_name;
	}
	public void setSchedule_name(String schedule_name) {
		this.schedule_name = schedule_name;
	}
	public String getSchedule_content() {
		return schedule_content;
	}
	public void setSchedule_content(String schedule_content) {
		this.schedule_content = schedule_content;
	}
	public Date getSchedule_start_date() {
		return schedule_start_date;
	}
	public void setSchedule_start_date(Date schedule_start_date) {
		this.schedule_start_date = schedule_start_date;
	}
	public Date getSchedule_end_date() {
		return schedule_end_date;
	}
	public void setSchedule_end_date(Date schedule_end_date) {
		this.schedule_end_date = schedule_end_date;
	}
	public Date getSchedule_register_date() {
		return schedule_register_date;
	}
	public void setSchedule_register_date(Date schedule_register_date) {
		this.schedule_register_date = schedule_register_date;
	}
	public int getSchedule_emp_no() {
		return schedule_emp_no;
	}
	public void setSchedule_emp_no(int schedule_emp_no) {
		this.schedule_emp_no = schedule_emp_no;
	}
	public int getSchedule_editor() {
		return schedule_editor;
	}
	public void setSchedule_editor(int schedule_editor) {
		this.schedule_editor = schedule_editor;
	}
	public String getSchedule_category() {
		return schedule_category;
	}
	public void setSchedule_category(String schedule_category) {
		this.schedule_category = schedule_category;
	}
	public Date getSchedule_edit_date() {
		return schedule_edit_date;
	}
	public void setSchedule_edit_date(Date schedule_edit_date) {
		this.schedule_edit_date = schedule_edit_date;
	}
	public boolean isSchedule_del() {
		return schedule_del;
	}
	public void setSchedule_del(boolean schedule_del) {
		this.schedule_del = schedule_del;
	}
	public String getSchedule_color() {
		return schedule_color;
	}
	public void setSchedule_color(String schedule_color) {
		this.schedule_color = schedule_color;
	}

}
