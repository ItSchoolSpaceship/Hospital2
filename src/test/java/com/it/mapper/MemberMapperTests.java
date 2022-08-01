package com.it.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.it.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {

	@Autowired
	private MemberMapper mapper;
	
	@Test
	public void insert() throws Exception{
		MemberVO member = new MemberVO();
		
		member.setMember_id("test4");
		member.setMember_pwd("test");
		member.setMember_name("test");
		member.setMember_address("test");
		member.setMember_email("test");
		member.setMember_phone("test");
		
		mapper.insert(member);
	}
/*	
	@Test
	public void getList() throws Exception{
		memberMapper.List();
	}
	
	@Test
	public void delete() throws Exception{
		memberMapper.delete(6L);
	}*/
	
	@Test
	public void update() throws Exception{
		MemberVO member = new MemberVO();
		member.setMember_number(3L);
		member.setMember_id("ttest");
		member.setMember_pwd("11234");
		member.setMember_name("te");
		member.setMember_address("w주소");
		member.setMember_email("w2");
		member.setMember_phone("010");
		
		mapper.update(member);
	}
	
	@Test
	public void testRead() {
		MemberVO vo = mapper.read("admin90");
		log.info(vo);
		vo.getAuthList().forEach(authVO -> log.info(authVO));
	}
}
