package com.ruoyi.controller.ai;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.iot.domain.IotDeviceAlert;
import com.ruoyi.iot.domain.IotSensorData;
import com.ruoyi.iot.service.IIotDeviceAlertService;
import com.ruoyi.iot.service.IIotSensorDataService;
import com.ruoyi.system.domain.AgricultureBatchTask;
import com.ruoyi.system.service.IAgricultureBatchTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;

/**
 * DeepSeek AI 数据分析Controller
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/ai/deepseek")
public class DeepSeekAIController extends BaseController {

    @Autowired
    private IIotDeviceAlertService iotDeviceAlertService;

    @Autowired
    private IAgricultureBatchTaskService agricultureBatchTaskService;

    @Autowired
    private IIotSensorDataService iotSensorDataService;

    @Autowired
    private RestTemplate restTemplate;

    // DeepSeek API配置 - 可以在application.yml中配置
    @Value("${deepseek.api.url:https://api.deepseek.com/v1/chat/completions}")
    private String deepseekApiUrl;

    @Value("${deepseek.api.key:}")
    private String deepseekApiKey;

    /**
     * 获取最新的告警和任务数据
     */
    @GetMapping("/latestData")
    public AjaxResult getLatestData() {
        Map<String, Object> result = new HashMap<>();

        // 获取最新的10条告警数据（未处理的）
        IotDeviceAlert alertQuery = new IotDeviceAlert();
        alertQuery.setStatus(0); // 0-未处理
        List<IotDeviceAlert> alertList = iotDeviceAlertService.selectIotDeviceAlertList(alertQuery);
        // 只取最新的10条
        if (alertList.size() > 10) {
            alertList = alertList.subList(0, 10);
        }

        // 获取最新的10条待处理任务
        AgricultureBatchTask taskQuery = new AgricultureBatchTask();
        taskQuery.setStatus("0"); // 0-待处理
        List<AgricultureBatchTask> taskList = agricultureBatchTaskService.selectAgricultureBatchTaskList(taskQuery);
        // 只取最新的10条
        if (taskList.size() > 10) {
            taskList = taskList.subList(0, 10);
        }

        // 获取最新的传感器数据
        List<IotSensorData> sensorDataList = iotSensorDataService.selectLatestSensorData();

        result.put("alertList", alertList);
        result.put("taskList", taskList);
        result.put("sensorDataList", sensorDataList);

        return success(result);
    }

    /**
     * 调用DeepSeek API进行数据分析
     */
    @PostMapping("/analyze")
    public AjaxResult analyzeData(@RequestBody Map<String, Object> requestData) {
        try {
            // 检查API Key是否配置
            if (deepseekApiKey == null || deepseekApiKey.trim().isEmpty()) {
                return error("DeepSeek API Key 未配置，请在application.yml中配置 deepseek.api.key");
            }

            // 获取告警和任务数据
            List<?> alertList = (List<?>) requestData.get("alertList");
            List<?> taskList = (List<?>) requestData.get("taskList");

            // 获取最新的传感器数据
            List<IotSensorData> sensorDataList = iotSensorDataService.selectLatestSensorData();

            // 构建提示词
            String prompt = buildAnalysisPrompt(alertList, taskList, sensorDataList);

            // 调用DeepSeek API
            String analysisResult = callDeepSeekAPI(prompt);

            Map<String, Object> result = new HashMap<>();
            result.put("analysis", analysisResult);

            return success(result);
        } catch (Exception e) {
            logger.error("DeepSeek AI分析失败", e);
            return error("AI分析失败: " + e.getMessage());
        }
    }

    /**
     * 构建分析提示词
     */
    private String buildAnalysisPrompt(List<?> alertList, List<?> taskList, List<IotSensorData> sensorDataList) {
        StringBuilder prompt = new StringBuilder();
        prompt.append("你是一位智慧农业数据分析专家。请根据以下数据进行全面分析，并提供专业建议：\n\n");

        // 添加传感器数据
        prompt.append("## 实时传感器数据\n");
        if (sensorDataList != null && !sensorDataList.isEmpty()) {
            for (int i = 0; i < sensorDataList.size(); i++) {
                IotSensorData sensor = sensorDataList.get(i);
                prompt.append(String.format("%d. 设备: %s | 类型: %s\n",
                        i + 1, sensor.getSerialNumber(), sensor.getDeviceType()));
                prompt.append(String.format("   - 土壤温度: %.1f°C | 土壤湿度: %.1f%%\n",
                        sensor.getTemperature(), sensor.getHumidity()));
                prompt.append(String.format("   - 土壤PH值: %.1f | 氮: %.1fmg/kg | 磷: %.1fmg/kg | 钾: %.1fmg/kg\n",
                        sensor.getSoilPh(), sensor.getNitrogen(), sensor.getPhosphorus(), sensor.getPotassium()));
                prompt.append(String.format("   - 信号强度: %ddBm | 采集时间: %s\n",
                        sensor.getSignalStrength(), sensor.getCreateTime()));
            }
        } else {
            prompt.append("暂无传感器数据\n");
        }

        prompt.append("\n");

        // 添加告警数据
        prompt.append("## 设备告警数据（最新10条）\n");
        if (alertList != null && !alertList.isEmpty()) {
            for (int i = 0; i < alertList.size(); i++) {
                Map<String, Object> alert = (Map<String, Object>) alertList.get(i);
                prompt.append(String.format("%d. 设备: %s | 告警类型: %s | 告警值: %s | 时间: %s\n",
                        i + 1,
                        alert.get("deviceName"),
                        alert.get("alertType"),
                        alert.get("alertValue"),
                        alert.get("createTime")));
            }
        } else {
            prompt.append("暂无告警数据\n");
        }

        prompt.append("\n");

        // 添加任务数据
        prompt.append("## 农业任务数据（待处理）\n");
        if (taskList != null && !taskList.isEmpty()) {
            for (int i = 0; i < taskList.size(); i++) {
                Map<String, Object> task = (Map<String, Object>) taskList.get(i);
                prompt.append(String.format("%d. 任务名称: %s | 状态: %s | 计划时间: %s\n",
                        i + 1,
                        task.get("taskName"),
                        getTaskStatusText((String) task.get("taskStatus")),
                        task.get("planTime")));
            }
        } else {
            prompt.append("暂无待处理任务\n");
        }

        prompt.append("\n");
        prompt.append("## 分析要求\n");
        prompt.append("请从以下几个方面进行分析：\n");
        prompt.append("1. **传感器数据分析**: 分析土壤温湿度、PH值、NPK养分含量是否在合理范围内，识别异常数据\n");
        prompt.append("2. **告警分析**: 分析告警数据的趋势、严重程度和潜在问题\n");
        prompt.append("3. **任务优先级**: 根据传感器数据和告警情况，建议任务处理的优先级\n");
        prompt.append("4. **风险评估**: 识别可能影响农作物生长的风险因素\n");
        prompt.append("5. **改进建议**: 提供设备维护和农业管理的具体建议\n");
        prompt.append("6. **数据关联**: 分析传感器数据、告警与任务之间的关联性\n\n");
        prompt.append("请用中文回答，使用Markdown格式组织内容，包含清晰的标题和要点列表。");

        return prompt.toString();
    }

    /**
     * AI对话接口 - 用户可以咨询告警情况、农场实际情况等
     */
    @PostMapping("/chat")
    public AjaxResult chat(@RequestBody Map<String, Object> requestData) {
        try {
            // 检查API Key是否配置
            if (deepseekApiKey == null || deepseekApiKey.trim().isEmpty()) {
                return error("DeepSeek API Key 未配置，请在application.yml中配置 deepseek.api.key");
            }

            // 获取用户问题
            String userQuestion = (String) requestData.get("question");
            if (userQuestion == null || userQuestion.trim().isEmpty()) {
                return error("请输入您的问题");
            }

            // 获取对话历史（可选）
            List<Map<String, String>> chatHistory = (List<Map<String, String>>) requestData.get("history");

            // 获取当前农场数据作为上下文
            String contextData = buildContextData();

            // 构建对话提示词
            String prompt = buildChatPrompt(userQuestion, contextData);

            // 调用DeepSeek API
            String response = callDeepSeekChatAPI(prompt, chatHistory);

            Map<String, Object> result = new HashMap<>();
            result.put("answer", response);
            result.put("timestamp", System.currentTimeMillis());

            return success(result);
        } catch (Exception e) {
            logger.error("AI对话失败", e);
            return error("AI对话失败: " + e.getMessage());
        }
    }

    /**
     * 构建上下文数据
     */
    private String buildContextData() {
        StringBuilder context = new StringBuilder();

        // 获取最新传感器数据
        List<IotSensorData> sensorDataList = iotSensorDataService.selectLatestSensorData();
        if (sensorDataList != null && !sensorDataList.isEmpty()) {
            context.append("## 当前传感器数据\n");
            for (IotSensorData sensor : sensorDataList) {
                context.append(String.format("- 设备%s: 温度%.1f°C, 湿度%.1f%%, PH%.1f, 氮%.1fmg/kg, 磷%.1fmg/kg, 钾%.1fmg/kg\n",
                        sensor.getSerialNumber(), sensor.getTemperature(), sensor.getHumidity(),
                        sensor.getSoilPh(), sensor.getNitrogen(), sensor.getPhosphorus(), sensor.getPotassium()));
            }
            context.append("\n");
        }

        // 获取未处理告警
        IotDeviceAlert alertQuery = new IotDeviceAlert();
        alertQuery.setStatus(0);
        List<IotDeviceAlert> alertList = iotDeviceAlertService.selectIotDeviceAlertList(alertQuery);
        if (alertList != null && !alertList.isEmpty()) {
            context.append("## 未处理告警\n");
            int count = Math.min(alertList.size(), 5);
            for (int i = 0; i < count; i++) {
                IotDeviceAlert alert = alertList.get(i);
                context.append(String.format("- %s: %s (级别%d)\n",
                        alert.getDeviceName(), alert.getAlertName(), alert.getAlertLevel()));
            }
            if (alertList.size() > 5) {
                context.append(String.format("（还有%d条告警...）\n", alertList.size() - 5));
            }
            context.append("\n");
        }

        // 获取待处理任务
        AgricultureBatchTask taskQuery = new AgricultureBatchTask();
        taskQuery.setStatus("0");
        List<AgricultureBatchTask> taskList = agricultureBatchTaskService.selectAgricultureBatchTaskList(taskQuery);
        if (taskList != null && !taskList.isEmpty()) {
            context.append("## 待处理任务\n");
            int count = Math.min(taskList.size(), 5);
            for (int i = 0; i < count; i++) {
                AgricultureBatchTask task = taskList.get(i);
                context.append(String.format("- %s (计划: %s)\n",
                        task.getTaskName(), task.getPlanStart()));
            }
            if (taskList.size() > 5) {
                context.append(String.format("（还有%d个任务...）\n", taskList.size() - 5));
            }
            context.append("\n");
        }

        return context.toString();
    }

    /**
     * 构建对话提示词
     */
    private String buildChatPrompt(String userQuestion, String contextData) {
        StringBuilder prompt = new StringBuilder();
        prompt.append("你是一位智慧农业助手，负责回答用户关于农场管理、设备状态、告警处理等问题。\n\n");
        prompt.append("## 当前农场状态\n");
        prompt.append(contextData);
        prompt.append("\n## 用户问题\n");
        prompt.append(userQuestion);
        prompt.append("\n\n请用中文简洁、专业地回答用户的问题。如果问题涉及具体数据，请引用上述农场状态信息。");
        return prompt.toString();
    }

    /**
     * 调用DeepSeek API进行对话
     */
    private String callDeepSeekChatAPI(String prompt, List<Map<String, String>> chatHistory) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            headers.set("Authorization", "Bearer " + deepseekApiKey);

            Map<String, Object> requestBody = new HashMap<>();
            requestBody.put("model", "deepseek-chat");

            List<Map<String, String>> messages = new ArrayList<>();

            // 添加系统消息
            Map<String, String> systemMessage = new HashMap<>();
            systemMessage.put("role", "system");
            systemMessage.put("content", "你是一位专业的智慧农业助手，能够分析农场数据并提供专业建议。");
            messages.add(systemMessage);

            // 添加历史对话（如果有）
            if (chatHistory != null && !chatHistory.isEmpty()) {
                messages.addAll(chatHistory);
            }

            // 添加当前用户问题
            Map<String, String> userMessage = new HashMap<>();
            userMessage.put("role", "user");
            userMessage.put("content", prompt);
            messages.add(userMessage);

            requestBody.put("messages", messages);
            requestBody.put("max_tokens", 1000);
            requestBody.put("temperature", 0.7);

            HttpEntity<Map<String, Object>> request = new HttpEntity<>(requestBody, headers);
            ResponseEntity<Map> response = restTemplate.postForEntity(deepseekApiUrl, request, Map.class);

            if (response.getStatusCode().is2xxSuccessful() && response.getBody() != null) {
                Map<String, Object> responseBody = response.getBody();
                List<Map<String, Object>> choices = (List<Map<String, Object>>) responseBody.get("choices");
                if (choices != null && !choices.isEmpty()) {
                    Map<String, Object> firstChoice = choices.get(0);
                    Map<String, Object> messageObj = (Map<String, Object>) firstChoice.get("message");
                    return (String) messageObj.get("content");
                }
            }

            return "抱歉，AI助手暂时无法回答您的问题。";
        } catch (Exception e) {
            logger.error("调用DeepSeek Chat API失败", e);
            return "AI对话失败：" + e.getMessage() + "\n\n请检查网络连接和API配置。";
        }
    }

    /**
     * 调用DeepSeek API
     */
    private String callDeepSeekAPI(String prompt) {
        try {
            // 构建请求头
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            headers.set("Authorization", "Bearer " + deepseekApiKey);

            // 构建请求体
            Map<String, Object> requestBody = new HashMap<>();
            requestBody.put("model", "deepseek-chat");

            // 构建消息列表
            List<Map<String, String>> messages = new ArrayList<>();
            Map<String, String> message = new HashMap<>();
            message.put("role", "user");
            message.put("content", prompt);
            messages.add(message);

            requestBody.put("messages", messages);
            requestBody.put("max_tokens", 2000);
            requestBody.put("temperature", 0.7);

            HttpEntity<Map<String, Object>> request = new HttpEntity<>(requestBody, headers);

            // 发送请求
            ResponseEntity<Map> response = restTemplate.postForEntity(deepseekApiUrl, request, Map.class);

            // 解析响应
            if (response.getStatusCode().is2xxSuccessful() && response.getBody() != null) {
                Map<String, Object> responseBody = response.getBody();
                List<Map<String, Object>> choices = (List<Map<String, Object>>) responseBody.get("choices");
                if (choices != null && !choices.isEmpty()) {
                    Map<String, Object> firstChoice = choices.get(0);
                    Map<String, Object> messageObj = (Map<String, Object>) firstChoice.get("message");
                    return (String) messageObj.get("content");
                }
            }

            return "AI分析失败：未能获取有效响应";
        } catch (Exception e) {
            logger.error("调用DeepSeek API失败", e);
            return "AI分析失败：" + e.getMessage() + "\n\n请检查：\n1. API Key是否正确配置\n2. 网络连接是否正常\n3. DeepSeek服务是否可用";
        }
    }

    /**
     * 获取任务状态文本
     */
    private String getTaskStatusText(String status) {
        if (status == null) return "未知";
        switch (status) {
            case "0":
                return "待处理";
            case "1":
                return "进行中";
            case "2":
                return "已完成";
            case "3":
                return "已取消";
            default:
                return "未知";
        }
    }
}
