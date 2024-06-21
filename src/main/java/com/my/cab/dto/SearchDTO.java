package com.my.cab.dto;

import org.apache.ibatis.type.Alias;

@Alias("search")
public class SearchDTO {
    private String searchText;

    public String getSearchText() {
        return searchText;
    }

    public void setSearchText(String searchText) {
        this.searchText = searchText;
    }
}
