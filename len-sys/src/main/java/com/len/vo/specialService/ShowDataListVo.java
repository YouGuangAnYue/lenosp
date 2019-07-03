package com.len.vo.specialService;

/**
 * create by lvyifan
 */
public class ShowDataListVo {

    private Integer userid ;

    private Integer pageNum ;

    private Integer pageSize ;

    private Boolean status ;

    private String dateFormat ;

    public ShowDataListVo() {

    }

    public ShowDataListVo(Integer userid, Integer pageNum, Integer pageSize, Boolean status, String dateFormat) {
        this.userid = userid;
        this.pageNum = pageNum;
        this.pageSize = pageSize;
        this.status = status;
        this.dateFormat = dateFormat;
    }

    public String getDateFormat() {
        return dateFormat;
    }

    public void setDateFormat(String dateFormat) {
        this.dateFormat = dateFormat;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }
}
