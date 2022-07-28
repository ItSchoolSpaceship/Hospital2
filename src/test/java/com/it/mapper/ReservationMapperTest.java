package com.it.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.it.domain.ReservationVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReservationMapperTest {
	
	@Autowired
	private ReservationMapper reservationMapper; 
	
	@Test
	public void test() {
		ReservationVO reservation = new ReservationVO();
		reservation.setMember_id("test");
		reservation.setReservation_sympton("test");	
		reservationMapper.insert(reservation);
	}
	
	

}
