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

	private String snsLogin;
	
	private String status;
	
	private int amount;
}
