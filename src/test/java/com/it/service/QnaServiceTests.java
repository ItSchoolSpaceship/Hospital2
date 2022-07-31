package com.it.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;

import com.it.domain.QnaVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class QnaServiceTests {
	
	
	@Setter(onMethod_= {@Autowired})
	private QnaService service;
	
	 private MockMvc mockMvc;
	
	@Test // 삭제
	public void testDelete() {
		
		// 게시물 번호의 존재 여부를 확인하고 테스트할 것
		log.info("REMOVE RESULT:" + service.remove(6L));
	}
	
	
	

	
	@Test // 수정
	public void testUpdate() {
		
		QnaVO qna = service.get(7L);
		
		if(qna == null) {
			
			return;
		}
		qna.setQna_title("제목 수정합니다.");
		log.info("MODIFY RESULT:" + service.modify(qna));
	}
	
	
	
	@Test // 조회
	public void testGet() {
		
		log.info(service.get(1L));
	}
	
	
		
	
	@Test  // 목록
	public void testGetList() {
		
		service.getList().forEach(qna -> log.info(qna));
	}
	
	
	
	
	
	@Test  // 등록
	public void testRegister() {
		
		QnaVO qna = new QnaVO();
		qna.setMember_id("");
		qna.setQna_title("새로 작성하는 글");
		qna.setQna_content("새로 작성하는 내용");
		qna.setQna_writer("new");
		
		service.register(qna);
		
		log.info("생성된 게시물의 번호:" + qna.getMember_id());
		
	}
	
	
	@Test
	public void testExist() {
		
		log.info(service);
		assertNotNull(service);
	}
	
}
