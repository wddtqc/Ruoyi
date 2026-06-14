package com.ruoyi.iot.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.iot.domain.IotDevice;
import com.ruoyi.iot.service.IIotDeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;


import java.util.List;

/**
 * 设备Controller
 */
@RestController
@RequestMapping("/iot/device")
public class IotDeviceController extends BaseController {

    @Autowired
    private IIotDeviceService iotDeviceService;

    /**
     * 查询设备列表
     */
    @PreAuthorize("@ss.hasPermi('iot:device:list')")
    @GetMapping("/list")
    public TableDataInfo list(IotDevice iotDevice) {
        startPage();
        List<IotDevice> list = iotDeviceService.selectIotDeviceList(iotDevice);
        return getDataTable(list);
    }

    /**
     * 查询设备列表（无权限）
     */
    @GetMapping("/unAuthlist")
    public TableDataInfo unAuthlist(IotDevice iotDevice) {
        startPage();
        List<IotDevice> list = iotDeviceService.selectIotDeviceList(iotDevice);
        return getDataTable(list);
    }

    /**
     * 所有设备简短列表
     */
    @GetMapping("/all")
    public AjaxResult all() {
        return success(iotDeviceService.selectIotDeviceList(new IotDevice()));
    }

    /**
     * 摄像头列表
     */
    @GetMapping("/shortList")
    public TableDataInfo shortList(IotDevice iotDevice) {
        List<IotDevice> list = iotDeviceService.selectIotDeviceList(iotDevice);
        return getDataTable(list);
    }

    /**
     * 获取设备详细信息
     */
    @PreAuthorize("@ss.hasPermi('iot:device:query')")
    @GetMapping(value = "/{deviceId}")
    public AjaxResult getInfo(@PathVariable("deviceId") Long deviceId) {
        return success(iotDeviceService.selectIotDeviceById(deviceId));
    }

    /**
     * 根据设备编号查询设备
     */
    @PreAuthorize("@ss.hasPermi('iot:device:query')")
    @GetMapping("/getDeviceBySerialNumber/{serialNumber}")
    public AjaxResult getDeviceBySerialNumber(@PathVariable("serialNumber") String serialNumber) {
        IotDevice param = new IotDevice();
        param.setSerialNumber(serialNumber);
        List<IotDevice> list = iotDeviceService.selectIotDeviceList(param);
        return success(list.isEmpty() ? null : list.get(0));
    }

    /**
     * 设备数据同步
     */
    @PreAuthorize("@ss.hasPermi('iot:device:edit')")
    @GetMapping("/synchronization/{serialNumber}")
    public AjaxResult synchronization(@PathVariable("serialNumber") String serialNumber) {
        IotDevice param = new IotDevice();
        param.setSerialNumber(serialNumber);
        List<IotDevice> list = iotDeviceService.selectIotDeviceList(param);
        return success(list.isEmpty() ? null : list.get(0));
    }

    /**
     * 查询设备统计信息
     */
    @PreAuthorize("@ss.hasPermi('iot:device:list')")
    @GetMapping("/statistic")
    public AjaxResult statistic() {
        return success(iotDeviceService.selectIotDeviceList(new IotDevice()));
    }

    /**
     * 生成设备编号
     */
    @PreAuthorize("@ss.hasPermi('iot:device:add')")
    @GetMapping("/generator")
    public AjaxResult generator() {
        return success("DEV" + System.currentTimeMillis());
    }

    /**
     * 新增设备
     */
    @PreAuthorize("@ss.hasPermi('iot:device:add')")
    @Log(title = "设备", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody IotDevice iotDevice) {
        return toAjax(iotDeviceService.insertIotDevice(iotDevice));
    }

    /**
     * 修改设备
     */
    @PreAuthorize("@ss.hasPermi('iot:device:edit')")
    @Log(title = "设备", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody IotDevice iotDevice) {
        return toAjax(iotDeviceService.updateIotDevice(iotDevice));
    }

    /**
     * 删除设备
     */
    @PreAuthorize("@ss.hasPermi('iot:device:remove')")
    @Log(title = "设备", businessType = BusinessType.DELETE)
    @DeleteMapping("/{deviceIds}")
    public AjaxResult remove(@PathVariable Long[] deviceIds) {
        return toAjax(iotDeviceService.deleteIotDeviceByIds(deviceIds));
    }
}
