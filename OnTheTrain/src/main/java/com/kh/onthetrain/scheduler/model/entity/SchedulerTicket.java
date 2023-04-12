package com.kh.onthetrain.scheduler.model.entity;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SchedulerTicket {
	
	// no
	private int no;
	
	// 스케줄러no
	private int schedulerNo;
	
	// 종류코드
	private String code;
	
	// 출발시간
	private String depTime;
	
	// 도착시간
	private String arrTime;
	
	// 출발역
	private String depStation;
	
	// 도착역
	private String arrStation;
	
	// 인원
	private String peopleCount;
	
	// 비용
	private int cost;
	
	// 세부 내용
	private String detail;
}
