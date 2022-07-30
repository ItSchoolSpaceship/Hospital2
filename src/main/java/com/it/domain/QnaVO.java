package com.it.domain;

import lombok.Data;

@Data
public class QnaVO {
	
	public Long qna_number;      // 글 번호
	public String member_id;     // 멤버 아이디
	public String qna_title;     // 제목
	public String qna_content;   // 내용
	public String qna_writer;    // 작성자
	 
	
	
}


