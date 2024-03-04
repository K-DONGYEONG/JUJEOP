package com.gudi.jujeop.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AuthDao {
    Logger logger = LoggerFactory.getLogger(AuthDao.class);
	
    @Autowired(required = false)
	private SqlSessionTemplate sqlSessionTemplate = null;
}
