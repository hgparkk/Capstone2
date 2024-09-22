package com.spring.capstone2.kau.dao;

import org.apache.ibatis.annotations.Mapper;

import com.spring.capstone2.kau.dto.KAUDTO;
import com.spring.capstone2.kau.dto.KAUselectDTO;

@Mapper
public interface IKAUDAO {
	int getCount(String kauKind);
	KAUDTO selectKAU(KAUselectDTO kauSelectDTO);
	KAUDTO selectKAUByKAUNo(int kauNo);
}