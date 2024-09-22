package com.spring.capstone2.quota.dto;

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
public class QuotaDTO {
	private int quotaNo;
	private int companyNo;
	private String companyKind;
	private String companyName;
	private String quotaYear;
	private int quotaValue;
	private int quotaValidValue;
}