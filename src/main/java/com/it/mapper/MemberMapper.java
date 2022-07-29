package com.it.mapper;

import java.util.List;

import com.it.domain.MemberVO;

public interface MemberMapper {
	
	//회원가입
	public void insert(MemberVO member);
	//회원목록
	public List<MemberVO> List();
	//회원상세
	public MemberVO read(Long memberNumber);
	//회원삭제 - 마이페이지
	public MemberVO delete(Long memberNumber);
	//회원수정 - 마이페이지
	public void update(MemberVO member);
	
	
}
