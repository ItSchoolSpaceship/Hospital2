package com.it.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class QnaControllerTests {
	
	@Setter(onMethod_= {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();	
	}
	
	
	
	// Qna 삭제
	@Test
	public void testRemove() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/qna/remove")
				.param("qna_number", "25")
				).andReturn().getModelAndView().getViewName();
	}
	
	
	
	
	
	
	// Qna 수정
	@Test
	public void testModify() throws Exception {
		
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/qna/modify")
						.param("qna_number", "0")
						.param("member_id", "test")
						.param("qna_title", "수정된 테스트 새글 제목")
						.param("qna_content", "수정된 테스트 새글 내용")
						.param("qna_writer", "user00"))
				.andReturn().getModelAndView().getViewName();
	}
	
	
	
	// Qna 조회
	@Test
	public void testGet() throws Exception {
		
		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/qna/get")
				.param("qna_number", "2"))
				.andReturn()
				.getModelAndView().getModelMap());
	}
	
	
	// Qna 목록
	@Test
	public void testList() throws Exception {
		
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/qna/list"))
				 .andReturn()
				 .getModelAndView()
				 .getModelMap());
	}
	
	
	
	// Qna 등록 
	@Test
	public void testRegister() throws Exception {
		
		String resultPage = 
				mockMvc.perform(MockMvcRequestBuilders.post("/qna/register")
						.param("member_id", "")
						.param("qna_title", "테스트 새글 제목")
						.param("qna_content", "테스트 새글 내용")
						.param("qna_writer", "user00")
					).andReturn().getModelAndView().getViewName();
	}
}
	