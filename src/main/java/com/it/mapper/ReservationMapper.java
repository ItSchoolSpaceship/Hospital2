package com.it.mapper;

import com.it.domain.ReservationVO;

public interface ReservationMapper {

	public int insert(ReservationVO reservation);
	
	public void getList();
}
