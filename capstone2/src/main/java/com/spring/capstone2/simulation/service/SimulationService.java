package com.spring.capstone2.simulation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.capstone2.simulation.dao.ISimulationDAO;

@Service
public class SimulationService {
	
	@Autowired
	ISimulationDAO dao;
	
	public int getCount() {
		return dao.getCount();
	}
}