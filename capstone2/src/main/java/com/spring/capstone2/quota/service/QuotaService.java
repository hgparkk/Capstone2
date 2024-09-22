package com.spring.capstone2.quota.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.capstone2.quota.dao.IQuotaDAO;
import com.spring.capstone2.quota.dto.QuotaDTO;

@Service
public class QuotaService {
	
	@Autowired
	IQuotaDAO dao;
	
	public QuotaDTO selectQuota(int quotaNo) {
		return dao.selectQuota(quotaNo);
	}
}