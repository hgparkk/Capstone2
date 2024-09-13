package com.spring.capstone2.user.dao;

import org.apache.ibatis.annotations.Mapper;

import com.spring.capstone2.user.dto.UserDTO;

@Mapper
public interface IUserDAO {
	UserDTO idDupCheck(UserDTO idCheck);

	UserDTO emailDupCheck(UserDTO emailCheck);

	int insertUser(UserDTO user);

	UserDTO idFind(UserDTO user);

	UserDTO pwFind(UserDTO user);
	
	int pwReset(UserDTO user);

	UserDTO login(UserDTO loginInfo);

	int updateUser(UserDTO user);

	int deleteUser(String userId);
}