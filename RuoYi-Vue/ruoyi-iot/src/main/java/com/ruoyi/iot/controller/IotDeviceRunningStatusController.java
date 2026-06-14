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
        IotDeviceRunningStatus status = iotDeviceRunningStatusService.selectIotDeviceRunningStatusByDeviceId(deviceId);
        if (status == null) {
            status = new IotDeviceRunningStatus();
            status.setDeviceId(deviceId);
            status.setStatus(4); // 默认离线
        }
        return success(status);
    }

    /**
     * 根据设备ID查询运行状态（查询参数）
     */
    @PreAuthorize("@ss.hasPermi('iot:device:query')")
    @GetMapping("/getByDeviceId")
    public AjaxResult getByDeviceId(@RequestParam Long deviceId) {
        IotDeviceRunningStatus status = iotDeviceRunningStatusService.selectIotDeviceRunningStatusByDeviceId(deviceId);
        if (status == null) {
            status = new IotDeviceRunningStatus();
            status.setDeviceId(deviceId);
            status.setStatus(4); // 默认离线
        }
        return success(status);
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

    /**
     * 获取设备实时传感器数据（供前端大屏使用）
     * <p>
     * 功能说明：
     * 1. 根据设备ID查询运行状态表
     * 2. 解析things_model_value字段（JSON格式）
     * 3. 返回实时的温湿度、氮磷钾等传感器数据
     * 4. 前端可定时调用此接口实现大屏数据刷新
     * </p>
     *
     * 返回数据格式：
     * <pre>
     * {
     *   "code": 200,
     *   "msg": "操作成功",
     *   "data": {
     *     "deviceId": 1,
     *     "deviceName": "1号大棚土壤传感器",
     *     "serialNumber": "NPK-TEST-001",
     *     "status": 3,
     *     "statusText": "在线",
     *     "onlineTime": "2026-06-11 10:30:00",
     *     "updateTime": "2026-06-11 10:30:15",
     *     "rssi": -75,
     *     "sensorData": {
     *       "humidity": 32.5,
     *       "nitrogen": 45.0,
     *       "phosphorus": 18.0,
     *       "potassium": 92.0,
     *       "temperature": 23.5,
     *       "soilPH": 6.8
     *     }
     *   }
     * }
     * </pre>
     *
     * @param deviceId 设备ID
     * @return 设备实时数据
     */
    @PreAuthorize("@ss.hasPermi('iot:device:query')")
    @GetMapping("/realtimeData/{deviceId}")
    public AjaxResult getRealtimeData(@PathVariable Long deviceId) {
        IotDeviceRunningStatus status = iotDeviceRunningStatusService.selectIotDeviceRunningStatusByDeviceId(deviceId);

        if (status == null) {
            return error("设备运行状态不存在，设备ID: " + deviceId);
        }

        // 构建返回数据
        com.alibaba.fastjson2.JSONObject result = new com.alibaba.fastjson2.JSONObject();
        result.put("deviceId", status.getDeviceId());
        result.put("deviceName", status.getDeviceName());
        result.put("serialNumber", status.getSerialNumber());
        result.put("status", status.getStatus());
        result.put("statusText", status.getStatus() == 3 ? "在线" : "离线");
        result.put("onlineTime", status.getOnlineTime());
        result.put("updateTime", status.getUpdateTime());
        result.put("rssi", status.getRssi());

        // 解析物模型值（things_model_value字段）
        String thingsModelValue = status.getThingsModelValue();
        if (thingsModelValue != null && !thingsModelValue.trim().isEmpty()) {
            try {
                com.alibaba.fastjson2.JSONObject sensorData = com.alibaba.fastjson2.JSON.parseObject(thingsModelValue);
                result.put("sensorData", sensorData);
            } catch (Exception e) {
                logger.error("解析物模型值失败: {}", thingsModelValue, e);
                result.put("sensorData", new com.alibaba.fastjson2.JSONObject());
            }
        } else {
            result.put("sensorData", new com.alibaba.fastjson2.JSONObject());
        }

        return success(result);
    }

    /**
     * 批量获取多个设备的实时数据（供前端大屏使用）
     * <p>
     * 适用场景：大屏需要同时展示多个设备的数据
     * </p>
     *
     * @param deviceIds 设备ID数组（逗号分隔，如：1,2,3）
     * @return 多个设备的实时数据列表
     */
    @PreAuthorize("@ss.hasPermi('iot:device:query')")
    @GetMapping("/realtimeData/batch")
    public AjaxResult getBatchRealtimeData(@RequestParam String deviceIds) {
        try {
            String[] idArray = deviceIds.split(",");
            java.util.List<com.alibaba.fastjson2.JSONObject> resultList = new java.util.ArrayList<>();

            for (String idStr : idArray) {
                Long deviceId = Long.parseLong(idStr.trim());
                IotDeviceRunningStatus status = iotDeviceRunningStatusService.selectIotDeviceRunningStatusByDeviceId(deviceId);

                if (status != null) {
                    com.alibaba.fastjson2.JSONObject deviceData = new com.alibaba.fastjson2.JSONObject();
                    deviceData.put("deviceId", status.getDeviceId());
                    deviceData.put("deviceName", status.getDeviceName());
                    deviceData.put("serialNumber", status.getSerialNumber());
                    deviceData.put("status", status.getStatus());
                    deviceData.put("statusText", status.getStatus() == 3 ? "在线" : "离线");
                    deviceData.put("updateTime", status.getUpdateTime());
                    deviceData.put("rssi", status.getRssi());

                    // 解析物模型值
                    String thingsModelValue = status.getThingsModelValue();
                    if (thingsModelValue != null && !thingsModelValue.trim().isEmpty()) {
                        try {
                            com.alibaba.fastjson2.JSONObject sensorData = com.alibaba.fastjson2.JSON.parseObject(thingsModelValue);
                            deviceData.put("sensorData", sensorData);
                        } catch (Exception e) {
                            logger.error("解析物模型值失败: {}", thingsModelValue, e);
                            deviceData.put("sensorData", new com.alibaba.fastjson2.JSONObject());
                        }
                    } else {
                        deviceData.put("sensorData", new com.alibaba.fastjson2.JSONObject());
                    }

                    resultList.add(deviceData);
                }
            }

            return success(resultList);

        } catch (Exception e) {
            logger.error("批量查询设备实时数据失败", e);
            return error("批量查询失败: " + e.getMessage());
        }
    }
}
