package com.ruoyi.iot.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.iot.domain.IotSensorData;
import com.ruoyi.iot.service.IIotSensorDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 农业传感器数据Controller
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/iot/sensor")
public class IotSensorDataController extends BaseController {

    @Autowired
    private IIotSensorDataService iotSensorDataService;

    /**
     * 查询所有设备的最新传感器数据
     */
    @GetMapping("/latest")
    public AjaxResult getLatestSensorData() {
        List<IotSensorData> list = iotSensorDataService.selectLatestSensorData();
        return AjaxResult.success(list);
    }

    /**
     * 查询指定设备的最新传感器数据
     */
    @GetMapping("/latest/{serialNumber}")
    public AjaxResult getLatestBySerialNumber(@PathVariable String serialNumber) {
        IotSensorData data = iotSensorDataService.selectLatestBySerialNumber(serialNumber);
        return AjaxResult.success(data);
    }
}
