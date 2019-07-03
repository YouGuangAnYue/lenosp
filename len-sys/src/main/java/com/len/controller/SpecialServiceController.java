package com.len.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.len.base.BaseController;
import com.len.core.shiro.Principal;
import com.len.entity.SysLog;
import com.len.exception.MyException;
import com.len.mapper.SysLogMapper;
import com.len.util.CustomUsernamePasswordToken;
import com.len.util.JsonUtil;
import com.len.util.ReType;
import com.len.vo.specialService.ShowDataListVo;
import com.len.vo.utils.Response;
import com.len.vo.utils.Result;
import com.qianlima.specialservice.api.CustomizationRmydService;
import com.qianlima.specialservice.beans.dto.CustomizationExcelRmydDto;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * create by lvyifan
 */
@Controller
@RequestMapping(value = "/specialService")
@Slf4j
@Api(value = "人民邮电",description="操作推送数据")
public class SpecialServiceController extends BaseController {

    @Reference(version = "1.0")
    private CustomizationRmydService rmydService ;

    @GetMapping(value = "showData")
    public String dataList(Model model){
        model.addAttribute("username",Principal.getCurrentUse().getUsername());
        return "system/specialService/rmydList" ;
    }

    /**
     * 获取数据列表
     *
     * @param vo
     * @return
     */
    @GetMapping(value = "/showDataList")
    @ResponseBody
    public ReType showDataList(ShowDataListVo vo) {
        ReType reType = null;
        try {
            List<CustomizationExcelRmydDto> list = rmydService.getRmydList(vo.getDateFormat(), vo.getUserid(), vo.getStatus());
            for (CustomizationExcelRmydDto dto : list) {
                if (dto.getProgName().length()>10) dto.setProgName(dto.getProgName().substring(0,10) + "...");
            }
            int from = 0, to = 0;
            from = (vo.getPageNum() - 1) * vo.getPageSize();
            if (vo.getPageNum() * vo.getPageSize() <= list.size()) {
                to = vo.getPageNum() * vo.getPageSize();
            } else {
                to = list.size();
            }
            List<CustomizationExcelRmydDto> ret = list.subList(from, to);

//            reType = new ReType(200,"展示数据成功",list.size(),vo.getPageNum().longValue(),ret);
            reType = new ReType(list.size(), ret);
        } catch (Exception e) {
            reType = new ReType(1000, "展示数据失败", 0, vo.getPageNum().longValue(), null);
        }

        return reType;

    }

    /**
     * 获取数据详情
     *
     * @param id
     * @return
     */
    @GetMapping(value = "/showDataDetail")
    @ResponseBody
    public Result<CustomizationExcelRmydDto> showDataDetail(Integer id) {
        try {
            CustomizationExcelRmydDto rmydData = rmydService.getRmydData(id);
            if (rmydData != null)
                return Response.success(rmydData);
            return Response.fail("查询失败");
        } catch (Exception e) {
            e.printStackTrace();
            return Response.fail("服务器忙");
        }


    }

    /**
     * 添加新数据
     *
     * @param dto
     * @return
     */
    @PostMapping(value = "/add")
    @ResponseBody
    public Result<String> add(CustomizationExcelRmydDto dto) {
        Integer n = rmydService.addRmyd(dto);

        if (n > 0) {
            rmydService.addLog(dto.getId(), dto.getModifyUser());
            return Response.success("添加成功");
        } else return Response.fail("添加失败");
    }

    /**
     * 删除数据
     *
     * @param id
     * @return
     */
    @PostMapping(value = "/del")
    @ResponseBody
    public Result<String> del(@ApiParam(value = "数据id") @RequestParam(value = "id") Integer id,
                              @ApiParam(value = "操作人") @RequestParam(value = "modifyUser") String modifyUser) {
        Integer n = rmydService.deleteRmyd(id);
        if (n > 0) {
            rmydService.addDelLog(id, modifyUser);
            return Response.success("删除成功");
        } else return Response.fail("删除失败");
    }

    /**
     * 修改数据
     *
     * @param dto
     * @return
     */
    @PostMapping(value = "/update")
    @ResponseBody
    public Result<String> update(CustomizationExcelRmydDto dto) {
        Integer n = rmydService.updateRmyd(dto);

        if (n > 0) {
            rmydService.addLog(dto.getId(), dto.getModifyUser());
            return Response.success("修改成功");
        } else return Response.fail("修改失败");
    }

    /**
     * 修改审核状态
     *
     * @param id
     * @return
     */
    @PostMapping(value = "/updateStatus")
    @ResponseBody
    public Result<String> updateStatus(@ApiParam(value = "数据id") @RequestParam(value = "id") Integer id,
                                       @ApiParam(value = "操作人") @RequestParam(value = "modifyUser") String modifyUser) {
        //String modifyUser = "aaa" ;
        Integer n = rmydService.addLog(id, modifyUser);
        if (n > 0) {
            rmydService.addLog(id, modifyUser);
            return Response.success("修改成功");
        } else return Response.fail("修改失败");
    }

    /**
     * 获取userId列表
     *
     * @param userGroup
     * @return
     */
    @GetMapping(value = "/showUser")
    @ResponseBody
    public Result<List<Integer>> showUser(@ApiParam(value = "用户所在分组") @RequestParam(value = "userGroup") String userGroup) {
        List<Integer> list = rmydService.getUserIdListByUserGroup(userGroup);
        if (list != null || list.size() == 0) {
            return Response.success(list);
        }
        return Response.fail("没有用户");
    }

}
