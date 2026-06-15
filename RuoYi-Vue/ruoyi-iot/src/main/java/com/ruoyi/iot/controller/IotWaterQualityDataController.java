package com.ruoyi.iot.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.iot.domain.IotWaterQualityData;
import com.ruoyi.iot.service.IIotWaterQualityDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 水质监测数据Controller
 *
 * @author ruoyi
 * @date 2026-06-15
 */
@RestController
@RequestMapping("/iot/waterQualityData")
public class IotWaterQualityDataController extends BaseController
{
    @Autowired
    private IIotWaterQualityDataService iotWaterQualityDataService;

    /**
     * 查询水质监测数据列表
     */
    @PreAuthorize("@ss.hasPermi('iot:waterQualityData:list')")
    @GetMapping("/list")
    public TableDataInfo list(IotWaterQualityData iotWaterQualityData)
    {
        startPage();
        List<IotWaterQualityData> list = iotWaterQualityDataService.selectIotWaterQualityDataList(iotWaterQualityData);
        return getDataTable(list);
    }

    /**
     * 导出水质监测数据列表
     */
    @PreAuthorize("@ss.hasPermi('iot:waterQualityData:export')")
    @Log(title = "水质监测数据", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, IotWaterQualityData iotWaterQualityData)
    {
        List<IotWaterQualityData> list = iotWaterQualityDataService.selectIotWaterQualityDataList(iotWaterQualityData);
        ExcelUtil<IotWaterQualityData> util = new ExcelUtil<IotWaterQualityData>(IotWaterQualityData.class);
        util.exportExcel(response, list, "水质监测数据");
    }

    /**
     * 获取水质监测数据详细信息
     */
    @PreAuthorize("@ss.hasPermi('iot:waterQualityData:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(iotWaterQualityDataService.selectIotWaterQualityDataById(id));
    }

    /**
     * 查询设备最新数据
     */
    @GetMapping("/latest/{serialNumber}")
    public AjaxResult getLatest(@PathVariable("serialNumber") String serialNumber)
    {
        IotWaterQualityData data = iotWaterQualityDataService.selectLatestDataBySerialNumber(serialNumber);
        return success(data);
    }

    /**
     * 新增水质监测数据
     */
    @PreAuthorize("@ss.hasPermi('iot:waterQualityData:add')")
    @Log(title = "水质监测数据", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody IotWaterQualityData iotWaterQualityData)
    {
        return toAjax(iotWaterQualityDataService.insertIotWaterQualityData(iotWaterQualityData));
    }

    /**
     * 修改水质监测数据
     */
    @PreAuthorize("@ss.hasPermi('iot:waterQualityData:edit')")
    @Log(title = "水质监测数据", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody IotWaterQualityData iotWaterQualityData)
    {
        return toAjax(iotWaterQualityDataService.updateIotWaterQualityData(iotWaterQualityData));
    }

    /**
     * 删除水质监测数据
     */
    @PreAuthorize("@ss.hasPermi('iot:waterQualityData:remove')")
    @Log(title = "水质监测数据", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(iotWaterQualityDataService.deleteIotWaterQualityDataByIds(ids));
    }
}
