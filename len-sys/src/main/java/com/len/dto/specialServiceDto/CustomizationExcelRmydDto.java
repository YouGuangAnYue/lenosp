package com.len.dto.specialServiceDto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

/**
 * @author Lun_qs
 * @version 0.0.1
 * @time 2019/6/21
* 数据来自于 qlmservice.
 */

@Getter
@Setter
@ApiModel("修改Excel文件的Dto类")
public class CustomizationExcelRmydDto {
    @ApiModelProperty(value = "主键")
    private Integer id;
    @ApiModelProperty(value = "用户id")
    private Integer userid;
    @ApiModelProperty(value = "内容id")
    private String contentid;
    @ApiModelProperty(value = "推送时间")
    private Integer updatetime;
    @ApiModelProperty(value = "订阅器")
    private String serviceTitle;
//    private String keywords;
    @ApiModelProperty(value = "数据类型")
    private String datatype;
    @ApiModelProperty(value = "项目名称")
    private String progName;
    @ApiModelProperty(value = "项目编号")
    private String progCode;
    @ApiModelProperty(value = "省")
    private String province;
    @ApiModelProperty(value = "市")
    private String city;
    @ApiModelProperty(value = "甲方单位")
    private String jiaUnit;
    @ApiModelProperty(value = "中标单位")
    private String zhongUnit;
    @ApiModelProperty(value = "中标金额")
    private BigDecimal bidNum;
    @ApiModelProperty(value = "折扣率")
    private String disNum;
    @ApiModelProperty(value = "详情url")
    private String url;
    @ApiModelProperty(value = "推送时间")
    private String publishDate;
    @ApiModelProperty(value = "状态")
    private Boolean status;
    @ApiModelProperty(value = "操作人")
    private String modifyUser;
}
