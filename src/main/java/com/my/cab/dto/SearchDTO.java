package com.my.cab.dto;

import org.apache.ibatis.type.Alias;

@Alias("search")
public class SearchDTO {
    private String searchText;
    private String filterTaxiModel;
    private String filterIsActive;
    private String filterStartDate;
    private String filterEndDate;
    private String page;

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }

    public String getFilterTaxiModel() {
        return filterTaxiModel;
    }

    public void setFilterTaxiModel(String filterTaxiModel) {
        this.filterTaxiModel = filterTaxiModel;
    }

    public String getFilterIsActive() {
        return filterIsActive;
    }

    public void setFilterIsActive(String filterIsActive) {
        this.filterIsActive = filterIsActive;
    }

    public String getFilterStartDate() {
        return filterStartDate;
    }

    public void setFilterStartDate(String filterStartDate) {
        this.filterStartDate = filterStartDate;
    }

    public String getFilterEndDate() {
        return filterEndDate;
    }

    public void setFilterEndDate(String filterEndDate) {
        this.filterEndDate = filterEndDate;
    }

    public String getSearchText() {
        return searchText;
    }

    public void setSearchText(String searchText) {
        this.searchText = searchText;
    }
}
