package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.QnaVO;
import com.it.mapper.QnaMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class QnaServiceImpl implements QnaService{

	
		@Setter(onMethod_=@Autowired)
		private QnaMapper mapper;
		
		
		// 등록
		@Override
		public void register(QnaVO qna) {
			
			log.info("register..." + qna);
			
			
			mapper.insertSelectKey(qna);
		}

		
		// 조회
		@Override
		public QnaVO get(Long qna_number) {
			
			log.info("get...." + qna_number);
			
			return mapper.read(qna_number);
		}

		// 수정
		@Override
		public boolean modify(QnaVO qna) {
			
			log.info("modify..." + qna);
			
			return mapper.update(qna) == 1;
		}
		
		
		// 삭제
		@Override
		public boolean remove(Long qna_number) {
			
			log.info("remove...." + qna_number);
			
			return mapper.delete(qna_number) == 1;
		}
		
		// 목록
		@Override
		public List<QnaVO> getList() {
			
			log.info("getList...");
			
			return mapper.getList();
		}
}
