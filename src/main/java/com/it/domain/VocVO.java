package com.it.domain;

import java.util.Date;

import lombok.Data;

@Data
public class VocVO {
	private long board_number;
	private String board_title;
	private String board_content;
	private String board_writer;
	private Date board_regdate;
	private Date board_updatedate;
	private String member_id;
}
