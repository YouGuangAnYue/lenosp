package com.len.vo.utils;


public enum ErrorCode {

    /**
     * Error:               程序报错
     * CertificationError： 用户名密码不正确
     * ProjectContentError：项目内容为空
     * ProjectTitleError:   项目标题为空
     * ProjectTypeError:    项目招标类型为空
     * ProjectCodeError:    招标项目编号为空
     */
    Success(200, "success"),
    Error(500, "api error"),
    CertificationError(120000,"api_account or api_secret missing"),
    ProjectContentError(120003,"project content is null"),
    ProjectTitleError(120004,"project title is null"),
    ProjectTypeError(120005,"project type is null"),
    ProjectCodeError(120006,"tender project type is null");

    private int code;
    private String message;

    ErrorCode(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
