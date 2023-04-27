package com.kh.onthetrain.myPage.model.entity;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class myTicket {
	
	// no
	private int ticketNo;
	
	// 멤버no
	private int userNo;
	
	//ktx
	private String type;
	
	// 열차 번호
	private int trainNum;
	
	// 출발날짜
	private Date depDate;
	
	// 출발시간
	private int depTime;
	
	// 도착시간
	private int arrTime;
	
	// 출발역
	private String departure;
	
	//도착역
	private String arrival;
	
	// 가격
	private int price;
	
	// 좌석 번호
	private String seat;

}
