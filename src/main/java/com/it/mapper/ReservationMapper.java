package com.it.mapper;

import java.util.List;

import com.it.domain.Criteria;
import com.it.domain.ReservationVO;

public interface ReservationMapper {

	public int insert(ReservationVO reservation);
	
	public List<ReservationVO> getList();
	
	public ReservationVO read(Long reservation_number);
	
	public ReservationVO readId(String member_id);

	public List<ReservationVO> getListWithPaging(Criteria cri);

	public int getTotalCount(Criteria cri);
	
	public int delete(Long reservation_number);
	
	public int update(ReservationVO reservation);
	
	public void insertSelectKey(ReservationVO reservation);
}

