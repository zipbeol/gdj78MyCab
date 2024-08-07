package com.my.cab.dto;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

@Alias("calendarDTO")
public class CalendarDTO {
	private int schedule_idx;
	private String schedule_name;
	private String schedule_content;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private LocalDateTime schedule_start_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private LocalDateTime schedule_end_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private LocalDateTime schedule_register_date;
	private int schedule_emp_no;
	private int schedule_editor;
	private String schedule_category;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private LocalDateTime schedule_edit_date;
	private boolean schedule_del;
	private String schedule_color;
	private String sechdule_emp_name;
	
	private String schedule_emp_email;
	private String schedule_emp_extension_number;
	private String schedule_dept_name;
	private int schedule_cal_idx;
	
	//캘린더
	private int calendar_idx;	
	private int calendar_emp_no;	
	private String calendar_name;	
	private String calendar_category;
	private String calendar_color;
	private String share_category;
	// 공유 캘린더
	private int share_idx;	
	private int share_cal_idx;
	private int shared_emp_no;
	
	public String getSechdule_emp_name() {
		return sechdule_emp_name;
	}
	public void setSechdule_emp_name(String sechdule_emp_name) {
		this.sechdule_emp_name = sechdule_emp_name;
	}
	public String getSchedule_dept_name() {
		return schedule_dept_name;
	}
	public void setSchedule_dept_name(String schedule_dept_name) {
		this.schedule_dept_name = schedule_dept_name;
	}
	public String getSchedule_emp_email() {
		return schedule_emp_email;
	}
	public void setSchedule_emp_email(String schedule_emp_email) {
		this.schedule_emp_email = schedule_emp_email;
	}
	public String getSchedule_emp_extension_number() {
		return schedule_emp_extension_number;
	}
	public void setSchedule_emp_extension_number(String schedule_emp_extension_number) {
		this.schedule_emp_extension_number = schedule_emp_extension_number;
	}
	
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
	public LocalDateTime getSchedule_start_date() {
		return schedule_start_date;
	}
	public void setSchedule_start_date(LocalDateTime schedule_start_date) {
		this.schedule_start_date = schedule_start_date;
	}
	public LocalDateTime getSchedule_end_date() {
		return schedule_end_date;
	}
	public void setSchedule_end_date(LocalDateTime schedule_end_date) {
		this.schedule_end_date = schedule_end_date;
	}
	public LocalDateTime getSchedule_register_date() {
		return schedule_register_date;
	}
	public void setSchedule_register_date(LocalDateTime schedule_register_date) {
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
	public LocalDateTime getSchedule_edit_date() {
		return schedule_edit_date;
	}
	public void setSchedule_edit_date(LocalDateTime schedule_edit_date) {
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
	public int getCalendar_idx() {
		return calendar_idx;
	}
	public void setCalendar_idx(int calendar_idx) {
		this.calendar_idx = calendar_idx;
	}
	public int getCalendar_emp_no() {
		return calendar_emp_no;
	}
	public void setCalendar_emp_no(int calendar_emp_no) {
		this.calendar_emp_no = calendar_emp_no;
	}
	public String getCalendar_name() {
		return calendar_name;
	}
	public void setCalendar_name(String calendar_name) {
		this.calendar_name = calendar_name;
	}
	public String getCalendar_category() {
		return calendar_category;
	}
	public void setCalendar_category(String calendar_category) {
		this.calendar_category = calendar_category;
	}
	public int getShare_idx() {
		return share_idx;
	}
	public void setShare_idx(int share_idx) {
		this.share_idx = share_idx;
	}
	public int getShare_cal_idx() {
		return share_cal_idx;
	}
	public void setShare_cal_idx(int share_cal_idx) {
		this.share_cal_idx = share_cal_idx;
	}
	public int getShared_emp_no() {
		return shared_emp_no;
	}
	public void setShared_emp_no(int shared_emp_no) {
		this.shared_emp_no = shared_emp_no;
	}
	public String getCalendar_color() {
		return calendar_color;
	}
	public void setCalendar_color(String calendar_color) {
		this.calendar_color = calendar_color;
	}
	public String getShare_category() {
		return share_category;
	}
	public void setShare_category(String share_category) {
		this.share_category = share_category;
	}
	public int getSchedule_cal_idx() {
		return schedule_cal_idx;
	}
	public void setSchedule_cal_idx(int schedule_cal_idx) {
		this.schedule_cal_idx = schedule_cal_idx;
	}
	
	
	

}
