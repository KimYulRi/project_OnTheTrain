package com.kh.onthetrain.myPage.model.entity;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class MyPageCoupon {
	
	// 쿠폰 번호
	private int couponNo;
	
	// 쿠폰 이름
	private String couponName;
	
	// 할인율
	private int discountRate;
	
	// 할인금액
	private int discountAmount;
	
	// 멤버 번호
	private int memberNo;
	
	// 쿠폰 상태
	private String status;
	
	// 쿠폰 만료일
	private Date expDate;
	
}
