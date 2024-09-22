package com.spring.capstone2.simulationLog.dto;

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
public class SimulationLogDTO {
	private int simulogNo;
	private int simuNo;
	private int kauNo;
	private Date kauDate;
	private int kauValue;
	private int simulogValue;
}