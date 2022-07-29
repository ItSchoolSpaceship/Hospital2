package com.it.mapper;

import java.util.List;

import com.it.domain.Criteria;
import com.it.domain.VocVO;

public interface VocMapper {
	public List<VocVO> getList();
	public void insert(VocVO voc);
	public void insertSelectKey(VocVO voc);
	public VocVO read(Long board_number);
	public List<VocVO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
	public int delete(Long board_number);
	public int update(VocVO voc);
}
