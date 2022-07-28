package com.it.mapper;

import com.it.domain.MemberVO;

public interface MemberMapper {
	
	public void insert(MemberVO member);
	
	public void update(MemberVO member);
	
	public void delete(MemberVO member);
	
	public MemberVO read();
}
