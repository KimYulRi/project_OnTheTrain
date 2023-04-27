package com.kh.onthetrain.myPage.model.entity;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class ReservationCheck {
	
	// 예약 번호
	public int no;
	
	// 회원 번호
	public int memberNo;
	
	// 숙소 번호
	public int accommodationNo;
	
	// 체크인 날짜
	public Date checkIn; 
	
	// 체크아웃 날짜
	public Date checkOut;
	
	// 숙소 가격 
	public int price;
	
	// 성인 숫자
	public int adultNumber;
	
	// 어린이 숫자
	public int kidNumber;
	
	// 유아 숫자
 	public int babyNumber;
 	
	
}
