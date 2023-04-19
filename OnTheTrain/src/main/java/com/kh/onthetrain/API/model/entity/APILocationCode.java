package com.kh.onthetrain.API.model.entity;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


// 스케줄러 일정 조회시 사용되는 API의 지역코드 조회
@Data
@Component
@NoArgsConstructor
@AllArgsConstructor
public class APILocationCode {

	private String code;

	private String name;

}
