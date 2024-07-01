package com.my.cab.dto;

import org.apache.ibatis.type.Alias;

@Alias("search")
public class SearchDTO {
    private String searchText;
    private String filterTaxiModel;
    private String filterIsActive;
    private String filterStartDate;
    private String filterEndDate;
    private String sortOrder;
    private String sortColumn;
    private String pro_filter;
    private String exp_filter;
    private String deal_filter;
    private String category;
    private int page;
    private String searchIdx;
    private String filterIsDriverFault;
    private String whereCalled;
    private int pageSize;
    private String filterIsRetired;
    private String filterForSearch;
    private String filterAttResult;
    private String filterAttDate;
    
    public String getFilterAttResult() {
		return filterAttResult;
	}

	public void setFilterAttResult(String filterAttResult) {
		this.filterAttResult = filterAttResult;
	}

	public String getFilterAttDate() {
		return filterAttDate;
	}

	public void setFilterAttDate(String filterAttDate) {
		this.filterAttDate = filterAttDate;
	}

	public String getPro_filter() {
        return pro_filter;
    }

    public void setPro_filter(String pro_filter) {
        this.pro_filter = pro_filter;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getSearchIdx() {
        return searchIdx;
    }

    public void setSearchIdx(String searchIdx) {
        this.searchIdx = searchIdx;
    }

    public String getFilterIsDriverFault() {
        return filterIsDriverFault;
    }

    public void setFilterIsDriverFault(String filterIsDriverFault) {
        this.filterIsDriverFault = filterIsDriverFault;
    }

    public String getWhereCalled() {
        return whereCalled;
    }

    public void setWhereCalled(String whereCalled) {
        this.whereCalled = whereCalled;
    }

    public String getFilterIsRetired() {
        return filterIsRetired;
    }

    public void setFilterIsRetired(String filterIsRetired) {
        this.filterIsRetired = filterIsRetired;
    }

    public String getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(String sortOrder) {
        this.sortOrder = sortOrder;
    }

    public String getSortColumn() {
        return sortColumn;
    }

    public void setSortColumn(String sortColumn) {
        this.sortColumn = sortColumn;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
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

    public String getExp_filter() {
        return exp_filter;
    }

    public void setExp_filter(String exp_filter) {
        this.exp_filter = exp_filter;
    }

    public String getFilterForSearch() {
        return filterForSearch;
    }

    public void setFilterForSearch(String filterForSearch) {
        this.filterForSearch = filterForSearch;
    }

    public String getDeal_filter() {
        return deal_filter;
    }

    public void setDeal_filter(String deal_filter) {
        this.deal_filter = deal_filter;
    }

}
