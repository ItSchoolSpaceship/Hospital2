package com.it.mapper;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.it.domain.Criteria;
import com.it.domain.ReservationVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReservationMapperTest {
	
	@Autowired
	private ReservationMapper mapper;
	private Date reservation_date; 
	
	@Test
	public void test() {
		ReservationVO reservation = new ReservationVO();
		reservation.setMember_id("test");
		reservation.setReservation_sympton("test");	
		mapper.insert(reservation);
	}
	@Test
	public void getList() throws Exception{
		mapper.getList();
	}
	
	
	@Test
	public void testInsert() {
		ReservationVO vo = new ReservationVO();
		vo.setReservation_sympton("도형이형 개인주의다");
		vo.setMember_id("고쳐줘");
		vo.setReservation_date("2022-08-07");
		
		mapper.insert(vo);
	}
	
	@Test
	public void testInsertSelectKey() {
		ReservationVO vo = new ReservationVO();
		vo.setReservation_sympton("기태형이아프다");
		vo.setMember_id("도형이형최고");
		mapper.insertSelectKey(vo);
	}
	
	@Test
	public void testRead() {
		ReservationVO reservation = mapper.read(1L);
		log.info(reservation);
	}
	
	@Test
	public void testDelete() {
		log.info("DELETE COUNT:"+mapper.delete(1L));
	}
	
	@Test
	public void testUpdate() {
		ReservationVO vo = new ReservationVO();
		vo.setReservation_number(8L);
		vo.setReservation_sympton("취업하자");
		vo.setMember_id("cha");
		int count = mapper.update(vo);
		log.info("UPDATE COUNT : " + count);
	}
	
	@Test
	public void testGetListWithPaging() {
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(10);
		List<ReservationVO> list=mapper.getListWithPaging(cri);
		list.forEach(reservation-> log.info(reservation));
		
	}
	@Test
	public void testSerch() {
		Criteria cri = new Criteria();
		cri.setKeyword("dd");
		cri.setType("dd");
		
		List<ReservationVO> list = mapper.getListWithPaging(cri);
		list.forEach(reservation->log.info(reservation));
	}

	
	
}
