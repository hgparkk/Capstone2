package com.spring.capstone2.quota.dao;

import org.apache.ibatis.annotations.Mapper;

import com.spring.capstone2.quota.dto.QuotaDTO;

@Mapper
public interface IQuotaDAO {
	public QuotaDTO selectQuota(int quotaNo);
}