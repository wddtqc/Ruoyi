package com.ruoyi.iot.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.iot.domain.IotDeviceRunningStatus;
import com.ruoyi.iot.service.IIotDeviceRunningStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 设备运行状态Controller
 */
@RestController
@RequestMapping("/iot/device/runningStatus")
public class IotDeviceRunningStatusController extends BaseController {

    @Autowired
    private IIotDeviceRunningStatusService iotDeviceRunningStatusService;

    /**
     * 查询设备运行状态列表
     */
    @PreAuthorize("@ss.hasPermi('iot:device:list')")
    @GetMapping("/list")
    public TableDataInfo list(IotDeviceRunningStatus iotDeviceRunningStatus) {
        startPage();
        List<IotDeviceRunningStatus> list = iotDeviceRunningStatusService.selectIotDeviceRunningStatusList(iotDeviceRunningStatus);
        return getDataTable(list);
    }

    /**
     * 获取设备运行状态详细信息
     */
    @PreAuthorize("@ss.hasPermi('iot:device:query')")
    @GetMapping(value = "/{statusId}")
    public AjaxResult getInfo(@PathVariable("statusId") Long statusId) {
        return success(iotDeviceRunningStatusService.selectIotDeviceRunningStatusById(statusId));
    }

    /**
     * 根据设备ID查询运行状态（路径参数，供前端 device.js 使用）
     */
    @PreAuthorize("@ss.hasPermi('iot:device:query')")
    @GetMapping("/device/{deviceId}")
    public AjaxResult getByDeviceIdPath(@PathVariable Long deviceId) {
        return success(iotDeviceRunningStatusService.selectIotDeviceRunningStatusByDeviceId(deviceId));
    }

    /**
     * 根据设备ID查询运行状态（查询参数）
     */
    @PreAuthorize("@ss.hasPermi('iot:device:query')")
    @GetMapping("/getByDeviceId")
    public AjaxResult getByDeviceId(@RequestParam Long deviceId) {
        return success(iotDeviceRunningStatusService.selectIotDeviceRunningStatusByDeviceId(deviceId));
    }

    /**
     * 新增设备运行状态
     */
    @PreAuthorize("@ss.hasPermi('iot:device:add')")
    @Log(title = "设备运行状态", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody IotDeviceRunningStatus iotDeviceRunningStatus) {
        return toAjax(iotDeviceRunningStatusService.insertIotDeviceRunningStatus(iotDeviceRunningStatus));
    }

    /**
     * 修改设备运行状态
     */
    @PreAuthorize("@ss.hasPermi('iot:device:edit')")
    @Log(title = "设备运行状态", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody IotDeviceRunningStatus iotDeviceRunningStatus) {
        return toAjax(iotDeviceRunningStatusService.updateIotDeviceRunningStatus(iotDeviceRunningStatus));
    }

    /**
     * 删除设备运行状态
     */
    @PreAuthorize("@ss.hasPermi('iot:device:remove')")
    @Log(title = "设备运行状态", businessType = BusinessType.DELETE)
    @DeleteMapping("/{statusIds}")
    public AjaxResult remove(@PathVariable Long[] statusIds) {
        return toAjax(iotDeviceRunningStatusService.deleteIotDeviceRunningStatusByIds(statusIds));
    }
}
