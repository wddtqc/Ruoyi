package com.ruoyi.iot.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.iot.domain.IotDeviceAlert;
import com.ruoyi.iot.service.IIotDeviceAlertService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 设备告警Controller
 */
@RestController
@RequestMapping("/iot/alert")
public class IotDeviceAlertController extends BaseController {

    @Autowired
    private IIotDeviceAlertService iotDeviceAlertService;

    /**
     * 查询设备告警列表
     */
    @PreAuthorize("@ss.hasPermi('iot:alert:list')")
    @GetMapping("/list")
    public TableDataInfo list(IotDeviceAlert iotDeviceAlert) {
        startPage();
        List<IotDeviceAlert> list = iotDeviceAlertService.selectIotDeviceAlertList(iotDeviceAlert);
        return getDataTable(list);
    }

    /**
     * 根据设备ID查询告警列表
     */
    @GetMapping("/listByDeviceId")
    public AjaxResult listByDeviceId(@RequestParam Long deviceId) {
        return success(iotDeviceAlertService.selectIotDeviceAlertListByDeviceId(deviceId));
    }

    /**
     * 导出设备告警列表
     */
    @PreAuthorize("@ss.hasPermi('iot:alert:export')")
    @Log(title = "设备告警", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, IotDeviceAlert iotDeviceAlert) {
        List<IotDeviceAlert> list = iotDeviceAlertService.selectIotDeviceAlertList(iotDeviceAlert);
        ExcelUtil<IotDeviceAlert> util = new ExcelUtil<>(IotDeviceAlert.class);
        util.exportExcel(response, list, "设备告警数据");
    }

    /**
     * 获取设备告警详细信息
     */
    @PreAuthorize("@ss.hasPermi('iot:alert:query')")
    @GetMapping(value = "/{alertId}")
    public AjaxResult getInfo(@PathVariable("alertId") Long alertId) {
        return success(iotDeviceAlertService.selectIotDeviceAlertById(alertId));
    }

    /**
     * 新增设备告警
     */
    @PreAuthorize("@ss.hasPermi('iot:alert:add')")
    @Log(title = "设备告警", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody IotDeviceAlert iotDeviceAlert) {
        return toAjax(iotDeviceAlertService.insertIotDeviceAlert(iotDeviceAlert));
    }

    /**
     * 修改设备告警
     */
    @PreAuthorize("@ss.hasPermi('iot:alert:edit')")
    @Log(title = "设备告警", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody IotDeviceAlert iotDeviceAlert) {
        return toAjax(iotDeviceAlertService.updateIotDeviceAlert(iotDeviceAlert));
    }

    /**
     * 处理告警
     */
    @PreAuthorize("@ss.hasPermi('iot:alert:handle')")
    @Log(title = "设备告警", businessType = BusinessType.UPDATE)
    @PutMapping("/handle")
    public AjaxResult handle(@RequestBody IotDeviceAlert iotDeviceAlert) {
        return toAjax(iotDeviceAlertService.handleIotDeviceAlert(iotDeviceAlert));
    }

    /**
     * 删除设备告警
     */
    @PreAuthorize("@ss.hasPermi('iot:alert:remove')")
    @Log(title = "设备告警", businessType = BusinessType.DELETE)
    @DeleteMapping("/{alertIds}")
    public AjaxResult remove(@PathVariable Long[] alertIds) {
        return toAjax(iotDeviceAlertService.deleteIotDeviceAlertByIds(alertIds));
    }
}
