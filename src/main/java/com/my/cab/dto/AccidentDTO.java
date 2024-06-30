package com.my.cab.dto;

import org.apache.ibatis.type.Alias;

@Alias("accident")
public class AccidentDTO {
    private String accident_history_idx;
    private String accident_history_taxi_idx;
    private String accident_history_driver_id;
    private String accident_history_accident_date;
    private String accident_history_description;
    private String accident_history_location;
    private boolean accident_history_is_at_fault;
    private String accident_history_driver_name;
    private String accident_history_taxi_license_plate;

    public String getAccident_history_taxi_license_plate() {
        return accident_history_taxi_license_plate;
    }

    public void setAccident_history_taxi_license_plate(String accident_history_taxi_license_plate) {
        this.accident_history_taxi_license_plate = accident_history_taxi_license_plate;
    }

    public String getAccident_history_driver_name() {
        return accident_history_driver_name;
    }

    public void setAccident_history_driver_name(String accident_history_driver_name) {
        this.accident_history_driver_name = accident_history_driver_name;
    }

    public String getAccident_history_idx() {
        return accident_history_idx;
    }

    public void setAccident_history_idx(String accident_history_idx) {
        this.accident_history_idx = accident_history_idx;
    }

    public String getAccident_history_taxi_idx() {
        return accident_history_taxi_idx;
    }

    public void setAccident_history_taxi_idx(String accident_history_taxi_idx) {
        this.accident_history_taxi_idx = accident_history_taxi_idx;
    }

    public String getAccident_history_driver_id() {
        return accident_history_driver_id;
    }

    public void setAccident_history_driver_id(String accident_history_driver_id) {
        this.accident_history_driver_id = accident_history_driver_id;
    }

    public String getAccident_history_accident_date() {
        return accident_history_accident_date;
    }

    public void setAccident_history_accident_date(String accident_history_accident_date) {
        this.accident_history_accident_date = accident_history_accident_date;
    }

    public String getAccident_history_description() {
        return accident_history_description;
    }

    public void setAccident_history_description(String accident_history_description) {
        this.accident_history_description = accident_history_description;
    }

    public String getAccident_history_location() {
        return accident_history_location;
    }

    public void setAccident_history_location(String accident_history_location) {
        this.accident_history_location = accident_history_location;
    }

    public boolean isAccident_history_is_at_fault() {
        return accident_history_is_at_fault;
    }

    public void setAccident_history_is_at_fault(boolean accident_history_is_at_fault) {
        this.accident_history_is_at_fault = accident_history_is_at_fault;
    }
}
