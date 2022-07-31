package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.Criteria;
import com.it.domain.VocVO;
import com.it.mapper.VocMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;


@Service
@AllArgsConstructor

public class VocServiceImpl {
	@Autowired
	private VocMapper mapper;
	
	public void register(VocVO voc) {
		mapper.insertSelectKey(voc);
	}
	
	public VocVO get(Long board_number) {
		return mapper.read(board_number);
	}
	
	public boolean modify(VocVO voc) {
		return mapper.update(voc)==1;
	}
	
	public boolean remove(Long board_number) {
		return mapper.delete(board_number)==1;
	}
	
	public List<VocVO> getList(Criteria cri){
		return mapper.getListWithPaging(cri);
	}
	
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
}
