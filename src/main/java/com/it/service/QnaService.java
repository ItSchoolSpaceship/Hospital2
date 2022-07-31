package com.it.service;

import java.util.List;

import com.it.domain.QnaVO;

public interface QnaService {
	
	// 등록
	public void register(QnaVO qna);
	
	// 조회
	public QnaVO get(Long qna_number);
	
	// 수정
	public boolean modify(QnaVO qna);
	
	// 삭제
	public boolean remove(Long qna_number);
	
	// 목록
	public List<QnaVO> getList();

	

	

	
}
