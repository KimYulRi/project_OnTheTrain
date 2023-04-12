package com.kh.onthetrain.scheduler.model.entity;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Component
@NoArgsConstructor
@AllArgsConstructor
public class Scheduler {

	//	no
	private int no;

	//	작성자no
	private int memberNo;

	//  공개여부
	private String visable;

	//  생성일자
	private Date createDate;

	//  수정일자
	private Date editDate;

}