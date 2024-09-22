package com.spring.capstone2.kau.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.capstone2.kau.dao.IKAUDAO;
import com.spring.capstone2.kau.dto.KAUDTO;
import com.spring.capstone2.kau.dto.KAUselectDTO;

@Service
public class KAUService {

	@Autowired
	IKAUDAO dao;
	
	public int getCount(String kauKind) {
		return dao.getCount(kauKind);
	}
	
	public KAUDTO selectKAU(KAUselectDTO kauSelectDTO) {
		return dao.selectKAU(kauSelectDTO);
	}
	
	public KAUDTO selectKAUByKAUNo(int kauNo) {
		return dao.selectKAUByKAUNo(kauNo);
	};
}