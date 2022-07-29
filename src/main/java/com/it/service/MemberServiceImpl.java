package com.it.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.MemberVO;
import com.it.mapper.MemberMapper;


@Service
public class MemberServiceImpl {

	private MemberMapper mapper;
	
	@Autowired
	public MemberServiceImpl(MemberMapper mapper) {
		this.mapper = mapper;
	}
	
	public void memberRegister(MemberVO member) {
		mapper.insert(member);
	}
	
	public List<MemberVO> memberList() {
		return mapper.List();
	}
	
	public void memberModify(MemberVO member) {
		mapper.update(member);
	}
	
	public void memberRemove(Long memberNumber) {
		mapper.delete(memberNumber);
	}
	
	
	
	
	

}
