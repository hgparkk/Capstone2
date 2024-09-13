package com.spring.capstone2.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.capstone2.user.dao.IUserDAO;
import com.spring.capstone2.user.dto.UserDTO;

@Service
public class UserService {

	@Autowired
	IUserDAO dao;

	public UserDTO idDupCheck(UserDTO idCheck) {
		return dao.idDupCheck(idCheck);
	}

	public UserDTO emailDupCheck(UserDTO emailCheck) {
		return dao.emailDupCheck(emailCheck);
	}

	public int insertUser(UserDTO user) {
		return dao.insertUser(user);
	}

	public UserDTO idFind(UserDTO user) {
		return dao.idFind(user);
	}

	public UserDTO pwFind(UserDTO user) {
		return dao.pwFind(user);
	}

	public int pwReset(UserDTO user) {
		return dao.pwReset(user);
	}

	public UserDTO login(UserDTO loginInfo) {
		return dao.login(loginInfo);
	}

	public int updateUser(UserDTO user) {
		return dao.updateUser(user);
	}

	public int deleteUser(String userId) {
		return dao.deleteUser(userId);
	}
}