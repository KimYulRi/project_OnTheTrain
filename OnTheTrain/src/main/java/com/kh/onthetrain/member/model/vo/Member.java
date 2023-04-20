package com.kh.onthetrain.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int no;
	
	private String membership;
	
	private String id;

	private String password;

	private String role;
	
	private String nickname;
	
	private String name;
	
	private Date birth;
	
	private String email;

	private String phone;

	private String address;
	
	private Date enrollDate;
	
	private Date modifyDate;
	
	// 간편로그인여부 (Y, N)
	private String snsLogin;
	
	// 상태값 (활성화 Y, 정지회원 N, 탈퇴회원 X)
	private String status;
	
	private int amount;
	
	// 간편로그인 유형 (카카오 K, 네이버 N)
	private String loginType;
	
	// 간편로그인 id
	private String snsId;
	
	/* 출력용 변수*/
	// 멤버쉽text
	private String membershipText;
	// 간편로그인text
	private String loginTypeText;
	// 회원상태text
	private String statusText;
	
	public void setMembership(String membership) {
		this.membership = membership;
		if(membership.equals("M1")) {
			membershipText="Bronze";
		}else if(membership.equals("M2")) {
			membershipText="Silver";
		}else if(membership.equals("M3")) {
			membershipText="Gold";
		}else {
			membershipText="VIP";
		}
	}
	
	public void setLoginType(String loginType) {
		this.loginType = loginType;
		if(loginType.equals("K")) {
			loginTypeText="카카오";
		}else if(loginType.equals("N")) {
			loginTypeText="네이버";
		}else if(loginType.equals("G")) {
			loginTypeText="구글";
		}else {
			loginTypeText="일반";
		}
	}
	
	public void setStatus(String status) {
		this.status = status;
		if(status.equals("Y")) {
			statusText="활성";
		}else if(status.equals("N")) {
			statusText="정지";
		}else if(status.equals("X")) {
			statusText="탈퇴";
		}
	}
}
