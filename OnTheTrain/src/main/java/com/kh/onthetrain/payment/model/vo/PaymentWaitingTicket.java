package com.kh.onthetrain.payment.model.vo;

import lombok.NoArgsConstructor;

import java.util.Date;

import lombok.AllArgsConstructor;

import lombok.Data;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentWaitingTicket {
	
	private int waitingNo;
	
	private int ticketNo;
	
	private int memberNo;

	private String type;
	
	private Date depDate;
	
	private int depTime;
	
	private int arrTime;
	
	private String departure;
	
	private String arrival;
	
	private int ticketPrice;
	
}
