package com.spring.capstone2.simulation.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ISimulationDAO {
	public int getCount();
}