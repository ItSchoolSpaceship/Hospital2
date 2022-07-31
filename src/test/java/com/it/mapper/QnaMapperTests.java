package com.it.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.it.domain.QnaVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class QnaMapperTests {
	
	@Setter(onMethod_=@Autowired)
	private QnaMapper mapper;
	
	
	@Test  // 수정   
	public void testUpdate() {
		
		QnaVO qna = new QnaVO();
		// 실행전 존재하는 번호인지 확일할 것
		qna.setQna_number(7L);
		qna.setMember_id("");
		qna.setQna_title("수정된 제목");
		qna.setQna_content("수정된 내용");
		qna.setQna_writer("user00");
		
		int count = mapper.update(qna);
		log.info("UPDATE COUNT:" + count);
	}
	
	

	
	@Test  // 삭제 
	public void testDelete() {
		
		log.info("DELETE COUNT:" + mapper.delete(1L));
	}
	
	

    
	@Test  // 조회
	public void testRead() {
		
		// 존재하는 게시물 번호로 테스트
		QnaVO qna = mapper.read(5L);
		
		log.info(qna);
	}

	
	
	

	@Test  // 등록 
	public void testInsertSelectKey() {
		
		QnaVO qna = new QnaVO();
		qna.setMember_id("1");
		qna.setQna_title("새로 작성하는 글 ");
		qna.setQna_content("새로 작성하는 내용");
		qna.setQna_writer("new");
		
		mapper.insertSelectKey(qna);
		
		log.info(qna);
	}

	
	
	@Test  // 등록 
	public void testInsert() {
		
		QnaVO qna = new QnaVO();
		qna.setMember_id("");
		qna.setQna_title("새로 작성하는 글");
		qna.setQna_content("새로 작성하는 내용");
		qna.setQna_writer("newbie");
		
		mapper.insert(qna);
		
		log.info(qna);
		
	}
	
	
	
	@Test 
	public void testGetList() {
		mapper.getList().forEach(qna -> log.info(qna));
	}

}
