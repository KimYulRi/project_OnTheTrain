package com.kh.onthetrain.scheduler.model.entity;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SchedulerComponent {

	// 종류코드
	private String code;

	// 코드명
	private String type;

}