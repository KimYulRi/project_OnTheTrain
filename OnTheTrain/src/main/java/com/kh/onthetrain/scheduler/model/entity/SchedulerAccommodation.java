package com.kh.onthetrain.scheduler.model.entity;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SchedulerAccommodation {

	// no
	private int no;

	// 스케줄러no
	private int schedulerNo;

	// ID
	private String id;
	
	// 사진no
	private int imageNo;

	// 숙소명
	private String name;

	// 시작시간
	private String start;

	// 종료시간
	private String end;

	// 위치
	private String location;

	// 별점
	private int stars;

	// 비용
	private int cost;

	// 세부사항
	private String detail;

}