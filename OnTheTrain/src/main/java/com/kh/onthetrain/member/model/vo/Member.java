package com.kh.onthetrain.member.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class Member {
	// 회원번호(pk)
	private int no;
	
	// 멤버십 코드
	private String membership;
	
	private String id;

	private String password;

	private String role;
	
	private String nickname;
	
	private String name;
	
	private Date birth;
	
	private String email;

	private String phone;

	// 주소 null 허용
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
	
	// 멤버십설정 메소드
	public void setMembershipText(String membership) {
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
	
	// 간편로그인설정 메소드
	public void setLoginTypeText(String loginType) {
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
	
	// 상태값설정 메소드
	public void setStatusText(String status) {
		if(status.equals("Y")) {
			statusText="정상";
		}else if(status.equals("N")) {
			statusText="정지";
		}else if(status.equals("X")) {
			statusText="탈퇴";
		}
	}
}
