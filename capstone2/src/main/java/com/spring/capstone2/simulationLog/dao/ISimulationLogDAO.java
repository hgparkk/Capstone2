package com.spring.capstone2.simulationLog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.capstone2.simulationLog.dto.SimulationLogDTO;

@Mapper
public interface ISimulationLogDAO {
	public int insertSimulationLog(SimulationLogDTO simulationLog);
	public List<SimulationLogDTO> selectSimulationLog(int simuNo);
	public int deleteSimulationLog(int simuNo);
}
