package com.kh.onthetrain.payment.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentWaitingReservation {
	
	private int waitingNo;
	
	private int reservationNo;
	
	private int memberNo;
	
	private int price;
	
	private int accommodationNo;
	
	private Date checkIn;
	
	private int adultNo;
	
	private String accommodationName;
	
	private String location;
	
	
}
