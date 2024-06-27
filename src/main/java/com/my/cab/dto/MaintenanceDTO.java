package com.my.cab.dto;

import org.apache.ibatis.type.Alias;

@Alias("maintenance")
public class MaintenanceDTO {
    private String maintenance_history_idx;
    private String maintenance_history_taxi_idx;
    private String maintenance_history_date;
    private String maintenance_history_description;
    private String maintenance_history_cost;
    private String maintenance_history_workshop_name;

    public String getMaintenance_history_idx() {
        return maintenance_history_idx;
    }

    public void setMaintenance_history_idx(String maintenance_history_idx) {
        this.maintenance_history_idx = maintenance_history_idx;
    }

    public String getMaintenance_history_taxi_idx() {
        return maintenance_history_taxi_idx;
    }

    public void setMaintenance_history_taxi_idx(String maintenance_history_taxi_idx) {
        this.maintenance_history_taxi_idx = maintenance_history_taxi_idx;
    }

    public String getMaintenance_history_date() {
        return maintenance_history_date;
    }

    public void setMaintenance_history_date(String maintenance_history_date) {
        this.maintenance_history_date = maintenance_history_date;
    }

    public String getMaintenance_history_description() {
        return maintenance_history_description;
    }

    public void setMaintenance_history_description(String maintenance_history_description) {
        this.maintenance_history_description = maintenance_history_description;
    }

    public String getMaintenance_history_cost() {
        return maintenance_history_cost;
    }

    public void setMaintenance_history_cost(String maintenance_history_cost) {
        this.maintenance_history_cost = maintenance_history_cost;
    }

    public String getMaintenance_history_workshop_name() {
        return maintenance_history_workshop_name;
    }

    public void setMaintenance_history_workshop_name(String maintenance_history_workshop_name) {
        this.maintenance_history_workshop_name = maintenance_history_workshop_name;
    }
}
