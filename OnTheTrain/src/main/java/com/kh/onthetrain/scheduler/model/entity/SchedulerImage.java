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
public class SchedulerImage {

	// no
	private int no;

	// 원본파일명
	private String origianlFilename;

	// 수정파일명
	private String renamedFilename;

	// 생성일자
	private Date createDate;
}
