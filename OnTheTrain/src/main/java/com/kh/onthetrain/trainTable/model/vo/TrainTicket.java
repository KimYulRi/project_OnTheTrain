package com.kh.onthetrain.trainTable.model.vo;

import java.util.Date;

import org.springframework.stereotype.Component;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component

public class TrainTicket {
	
	// no
	private int ticketNo;
	
	// 멤버no
	private int userNo;
	
	//ktx
	private String train;
	
	// 열차번호
	private int no;
	
	// 출발날짜
	private Date depDate;
	
	// 출발시간
	private int depTime;
	
	// 도착시간
	private int arrTime;
	
	// 출발역
	private String depname;
	
	//도착역
	private String arrplace;
	
	// 가격
	private int charge;
	
	
}
