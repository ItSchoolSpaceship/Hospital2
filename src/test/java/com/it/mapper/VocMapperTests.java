package com.it.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.it.domain.Criteria;
import com.it.domain.VocVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class VocMapperTests {
	@Autowired
	private VocMapper mapper;

	
	  @Test
	  public void testGetList()  {
		  log.info("---------------------");
		  mapper.getList(); }
	  
	  @Test
	  public void testInsert() { 
		  VocVO voc= new VocVO();
		  voc.setBoard_title("배액"); 
		  voc.setBoard_writer("배애액");
		  voc.setBoard_content("어어어");
		  
		  mapper.insert(voc);
	 
	  }
	 
	@Test
	public void testInsertSelectKey() {
		VocVO vo = new VocVO();
		vo.setBoard_title("배액");
		vo.setBoard_writer("배애액");
		vo.setBoard_content("배애액");
		mapper.insertSelectKey(vo);
		log.info(vo);
	}
	@Test
	public void testRead() {
		VocVO voc = mapper.read(1L);
		log.info(voc);
		
	}
	@Test
	public void testDelete() {
		log.info("DELETE COUNT: "+mapper.delete(1L));
	}
	@Test
	public void testUpdate() {
		VocVO voc=new VocVO();
		voc.setBoard_number(2L);
		voc.setBoard_title("수정됫어요");
		voc.setBoard_content("수정된내용");
		voc.setBoard_writer("유저00");
		
		int count = mapper.update(voc);
		log.info("UPDATE COUNT : " + count);
	}
	
	@Test
	public void testGetListWithPaging() {
		Criteria cri = new Criteria();
		cri.setPageNum(3);
		cri.setAmount(10);
		List<VocVO> list=mapper.getListWithPaging(cri);
		list.forEach(voc-> log.info(voc));
	}
	@Test
	public void testSerch() {
		Criteria cri =new Criteria();
		cri.setKeyword("dd");
		cri.setType("dd");
		
		List<VocVO> list = mapper.getListWithPaging(cri);
		list.forEach(voc->log.info(voc));
	}
}
