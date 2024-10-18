package com.spring.capstone2.simulation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.capstone2.simulation.dao.ISimulationDAO;
import com.spring.capstone2.simulation.dto.SimulationDTO;

@Service
public class SimulationService {

	@Autowired
	ISimulationDAO dao;

	public int getCount() {
		return dao.getCount();
	}

	public int insertSimulation(SimulationDTO simulation) {
		return dao.insertSimulation(simulation);
	}
	
	public List<SimulationDTO> selectSimulationList(String userId) {
		return dao.selectSimulationList(userId);
	}
	
	public SimulationDTO selectSimulation(int simuNo) {
		return dao.selectSimulation(simuNo);
	}
	
	public int deleteSimulation(int simuNo) {
		return dao.deleteSimulation(simuNo);
	}
}