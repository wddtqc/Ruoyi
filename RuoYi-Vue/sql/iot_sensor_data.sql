-- ========================================
-- 农业传感器历史数据表
-- ========================================
DROP TABLE IF EXISTS `iot_sensor_data`;

CREATE TABLE `iot_sensor_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `serial_number` varchar(64) DEFAULT NULL COMMENT '设备序列号',
  `device_type` varchar(32) DEFAULT NULL COMMENT '设备类型',
  `humidity` double DEFAULT NULL COMMENT '土壤湿度(%)',
  `temperature` double DEFAULT NULL COMMENT '土壤温度(°C)',
  `soil_ph` double DEFAULT NULL COMMENT '土壤PH值',
  `nitrogen` double DEFAULT NULL COMMENT '氮含量(mg/kg)',
  `phosphorus` double DEFAULT NULL COMMENT '磷含量(mg/kg)',
  `potassium` double DEFAULT NULL COMMENT '钾含量(mg/kg)',
  `signal_strength` int(11) DEFAULT NULL COMMENT '信号强度(dBm)',
  `device_timestamp` bigint(20) DEFAULT NULL COMMENT '设备时间戳(毫秒)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '系统入库时间',
  PRIMARY KEY (`id`),
  KEY `idx_serial_number` (`serial_number`) COMMENT '设备序列号索引',
  KEY `idx_device_type` (`device_type`) COMMENT '设备类型索引',
  KEY `idx_create_time` (`create_time`) COMMENT '创建时间索引',
  KEY `idx_device_timestamp` (`device_timestamp`) COMMENT '设备时间戳索引'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='农业传感器历史数据表';

-- ========================================
-- 索引说明
-- ========================================
-- idx_serial_number: 用于按设备序列号查询历史数据
-- idx_device_type: 用于按设备类型统计分析
-- idx_create_time: 用于按时间范围查询数据（时序查询）
-- idx_device_timestamp: 用于按设备上报时间排序
