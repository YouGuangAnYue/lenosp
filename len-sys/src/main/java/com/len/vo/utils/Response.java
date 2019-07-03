package com.len.vo.utils;

public class Response<T> {
    public static <T> Result<T> success(T data) {
        Result<T> result = new Result<>();
        result.setStatus(SuccessCode.SUCCESS.getCode());
        result.setMsg(SuccessCode.SUCCESS.getMessage());
        result.setData(data);
        return result;
    }

    public static <T> Result<T> fail(ErrorCode errorCode) {
        Result<T> result = new Result<>();
        result.setStatus(errorCode.getCode());
        result.setMsg(errorCode.getMessage());
        return result;
    }

    public static <T> Result<T> fail(String message) {
        Result<T> result = new Result<>();
        result.setStatus(0000);
        result.setMsg(message);
        return result;
    }

    public static <T> Result<T> fail(Integer code, String text) {
        Result<T> result = new Result<>();
        result.setStatus(code);
        result.setMsg(text);
        return result;
    }
}
