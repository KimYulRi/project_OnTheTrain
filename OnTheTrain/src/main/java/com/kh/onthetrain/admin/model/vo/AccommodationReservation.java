package com.kh.onthetrain.admin.model.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class AccommodationReservation {
	
	private int no;
	
	private int memberNo;
	
	private int accommodationNo;
	
	private Date checkin;
	
	private Date checkout;
	
	private int adultNumber;

	private String refundStatus;
	
}
