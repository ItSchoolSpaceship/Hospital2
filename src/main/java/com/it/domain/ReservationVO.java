package com.it.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data

public class ReservationVO {

	private Long reservation_number;
	private String member_id;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date  reservation_date;

	private String reservation_time;
	private String reservation_sympton;
		
	
}
