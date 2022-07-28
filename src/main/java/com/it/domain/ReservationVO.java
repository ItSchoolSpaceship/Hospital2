package com.it.domain;

import java.util.Date;

import lombok.Data;

@Data

public class ReservationVO {

	private Long reservation_number;
	private String member_id;
	private Date reservation_date;
	private Date reservation_time;
	private String reservation_sympton;
}
