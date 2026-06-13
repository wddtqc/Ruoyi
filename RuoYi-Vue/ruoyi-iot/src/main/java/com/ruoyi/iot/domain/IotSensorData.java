package com.ruoyi.iot.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 农业传感器历史数据实体类
 * 对应表：iot_sensor_data
 *
 * @author ruoyi
 */
@Data
public class IotSensorData implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    private Long id;

    /**
     * 设备序列号
     */
    private String serialNumber;

    /**
     * 设备类型
     */
    private String deviceType;

    /**
     * 土壤湿度
     */
    private Double humidity;

    /**
     * 土壤温度
     */
    private Double temperature;

    /**
     * 土壤PH值
     */
    private Double soilPh;

    /**
     * 氮含量
     */
    private Double nitrogen;

    /**
     * 磷含量
     */
    private Double phosphorus;

    /**
     * 钾含量
     */
    private Double potassium;

    /**
     * 信号强度
     */
    private Integer signalStrength;

    /**
     * 设备时间戳
     */
    private Long deviceTimestamp;

    /**
     * 系统入库时间
     */
    private Date createTime;
}
