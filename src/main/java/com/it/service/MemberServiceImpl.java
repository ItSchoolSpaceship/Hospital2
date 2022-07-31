package com.it.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.MemberVO;
import com.it.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl {

	private MemberMapper mapper;
	
	@Autowired
	public MemberServiceImpl(MemberMapper mapper) {
		this.mapper = mapper;
	}
	
	public void memberInsert(MemberVO member) {
		mapper.insert(member);
	}
	
	public MemberVO memberSelect(String id) {
		return mapper.read(id);
	}
	
	public void memberUpdate(MemberVO member) {
		
	}
	
	public void memberDelete(String id) {
		
	}

}
