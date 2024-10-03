package com.spring.capstone2.simulation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.capstone2.simulation.dto.SimulationDTO;

@Mapper
public interface ISimulationDAO {
	public int getCount();
	public int insertSimulation(SimulationDTO simulation);
	public List<SimulationDTO> selectSimulationList(String userId);
	public SimulationDTO selectSimulation(int simuNo);
}