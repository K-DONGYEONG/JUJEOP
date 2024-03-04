package com.gudi.jujeop.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDao {
     Logger logger = LoggerFactory.getLogger(PaymentDao.class);
     
     @Autowired
	private SqlSessionTemplate sqlSessionTemplate = null;

    public int kakaoInsert(Map<String, Object> pMap) {
     logger.info("kakaoInsert");
     int result = -1;
     result = sqlSessionTemplate.insert("kakaoInsert", pMap);
     return result;
    }

    public int payInsert(Map<String, Object> pMap) {
     logger.info("payInsert");
     int result = -1;
     result = sqlSessionTemplate.insert("payInsert", pMap);
     return result;
    }
}
