package com.kh.onthetrain.scheduler.model.vo;

import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SchedulerInfo {
	private String schedulerTitle;
    private Map<String, Map<String, Object>> schedulerComponents;
}
