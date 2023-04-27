package com.kh.onthetrain.scheduler.model.entity;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SchedulerEvent {

	// no
	private int no;

	// 스케줄러no
	private int schedulerNo;

	// ID
	private String id;
	
	// 이미지no
	private int imageNo;

	// 일정명
	private String title;

	// 시작시간
	private String start;

	// 종료시간
	private String end;

	// 위치
	private String location;

	// 비용
	private int cost;

	// 일정 세부 내용
	private String detail;

}
