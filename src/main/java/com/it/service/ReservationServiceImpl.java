package com.it.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.Criteria;
import com.it.domain.MemberVO;
import com.it.domain.ReservationVO;
import com.it.mapper.MemberMapper;
import com.it.mapper.ReservationMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReservationServiceImpl {
	
	@Autowired
	
	private ReservationMapper mapper;

	public void register(ReservationVO reservation) {
		mapper.insertSelectKey(reservation);
	}
	
	public ReservationVO get(Long reservation_number) {
		return mapper.read(reservation_number);
	}
	
	public ReservationVO getID(String member_id) {
		return mapper.readId(member_id);
	}
	
	public boolean modify(ReservationVO reservation) {
		return mapper.update(reservation)==1;
	}
	
	public boolean remove(Long reservation_number) {
		return mapper.delete(reservation_number)==1;
	}
	
	public List<ReservationVO> getList(Criteria cri){
		return mapper.getListWithPaging(cri);
	}
	
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
	
/*	public Map<String, List> getReservList(String member_id)
	{
		Map<String, List> dataMap = new HashMap<>();
		List<ReservationVO> reservation = mapper.readId(member_id);
		if(reservation.size()==0) { // 카트가 비어있음
			return null;		
		}
		
		List<MemberVO> member = selectMember(reservation);
		
		dataMap.put("reservation", reservation);
		dataMap.put("member", member);
		
		return dataMap; 
	}

	private List<MemberVO> selectMember(List<ReservationVO> reservation) {

		
			List<MemberVO> member = mapper2.selectMember( reservation);
			
			return member;
	
	}*/


}
