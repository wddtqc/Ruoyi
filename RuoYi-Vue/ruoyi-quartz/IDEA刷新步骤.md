# IDEA Maven刷新步骤

## 当前问题
IDEA没有识别到 `ruoyi-quartz` 对 `ruoyi-iot` 的依赖关系。

## 解决方案

### 步骤1：在IDEA中刷新Maven

1. 点击IDEA右侧的 **"Maven"** 工具窗口
2. 找到刷新按钮（🔄 循环箭头图标）并点击
3. 或者右键点击根项目 → **"Reload All Maven Projects"**

### 步骤2：重新构建项目

**菜单栏 → Build → Rebuild Project**

### 步骤3：验证依赖

在Maven窗口中展开：
```
ruoyi (根项目)
  └─ ruoyi-quartz
      └─ Dependencies
          └─ 应该能看到 ruoyi-iot:3.9.2
```

### 步骤4：清理IDEA缓存（如果前面步骤无效）

**菜单栏 → File → Invalidate Caches / Restart → Invalidate and Restart**

---

## 验证是否成功

打开 `RyTask.java`，第4行的 `import com.ruoyi.iot.mqtt.MqttPublisher;` 应该：
- ✅ 没有红色波浪线
- ✅ 可以按 `Ctrl + 鼠标左键` 跳转到 MqttPublisher 类

---

## 如果还是不行

告诉我，我会提供一个不依赖IoT模块的备用方案。
