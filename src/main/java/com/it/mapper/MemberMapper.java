package com.it.mapper;

import java.util.List;

import com.it.domain.MemberVO;
import com.it.domain.ReservationVO;

public interface MemberMapper {
	
	public void insert(MemberVO member);
	
	public void update(MemberVO member);
	
	public void delete(MemberVO member);
	
	public MemberVO read(String userid);
	public MemberVO readId(String userid);
	public List<MemberVO> selectMember(List<ReservationVO> reservation);

}
