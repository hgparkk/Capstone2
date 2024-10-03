package com.spring.capstone2.simulation.dto;

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
public class SimulationDTO {
	private int simuNo;
	private String userId;
	private int quotaNo;
	private String companyName;
	private String companyKind;
	private String simuAlias;
	private int simuRevenue;
	private int simuValue;
}