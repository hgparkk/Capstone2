package com.spring.capstone2.kau.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class KAUDTO {
	private int kauNo;
	private String kauKind;
	private Date kauDate;
	private int kauValue;
}