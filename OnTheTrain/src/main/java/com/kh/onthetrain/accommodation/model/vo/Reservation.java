package com.kh.onthetrain.accommodation.model.vo;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reservation {
	private int no;
	
	private int memberNo;
	
	private int accommodationNo;
	
	private Date checkIn;
	
	private Date checkOut;
	
	private int price;
	
	private int adultNumber;
	
	private int  kidNumber;
	
	private int babyNumber;

}
