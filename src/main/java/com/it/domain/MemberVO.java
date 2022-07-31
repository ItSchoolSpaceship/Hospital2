package com.it.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private Long member_number;
	private String member_id;
	private String member_pwd;
	private String member_name;
	private Date member_birth;
	private String member_address;
	private String member_email;
	private String member_phone;
	private List<AuthVO>authList;
	
}
