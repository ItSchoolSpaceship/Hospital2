package com.it.mapper;

import java.util.List;

import com.it.domain.QnaVO;

public interface QnaMapper {
	
	// 목록
	public List<QnaVO> getList();
	
	// 등록
	public void insert(QnaVO qna);
	
	public void insertSelectKey(QnaVO qna);
	
	// 조회
	public QnaVO read(Long qna_number);
	
	// 삭제
	public int delete(Long qna_number);
	
	// 수정
	public int update(QnaVO qna);

	
	
}
