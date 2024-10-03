package com.spring.capstone2.simulationLog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.capstone2.simulationLog.dao.ISimulationLogDAO;
import com.spring.capstone2.simulationLog.dto.SimulationLogDTO;

@Service
public class SimulationLogService {

	@Autowired
	ISimulationLogDAO dao;
	
	public int insertSimulationLog(SimulationLogDTO simulationLog) {
		return dao.insertSimulationLog(simulationLog);
	}
	
	public List<SimulationLogDTO> selectSimulationLog(int simuNo){
		return dao.selectSimulationLog(simuNo);
	}
}
