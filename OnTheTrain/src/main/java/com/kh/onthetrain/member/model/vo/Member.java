package com.kh.onthetrain.member.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

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
	
	// 간편로그인여부
	private String snsLogin;
	
	private String status;
	
	private int amount;
	
	// 간편로그인 유형 (카카오, 네이버)
	private String loginType;
	
	// 간편로그인 id
	private String snsId;
}
