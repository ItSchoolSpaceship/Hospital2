package com.it.sample;

import org.springframework.stereotype.Component;

import lombok.ToString;

//필드 주입 / 세터주입/ 생성자주입
@Component
@ToString
public class SampleHotel {

	private Chef chef;

	public SampleHotel(Chef chef) {
		super();
		this.chef = chef;
	}
	
}
