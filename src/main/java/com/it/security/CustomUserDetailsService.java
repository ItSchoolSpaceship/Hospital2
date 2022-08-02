package com.it.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.it.domain.MemberVO;
import com.it.mapper.MemberMapper;
import com.it.serurity.domain.CustomUser;

import lombok.extern.log4j.Log4j;
@Log4j
public class CustomUserDetailsService implements UserDetailsService{
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String member_name) throws UsernameNotFoundException {
		log.warn("Load User By member_id :" + member_name);
		
		MemberVO vo = memberMapper.read(member_name);
		
		log.warn("queried by member mapper: " + vo);
		
		return vo == null? null : new CustomUser(vo);
	}
	
	
}
