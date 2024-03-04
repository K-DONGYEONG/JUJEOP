package com.gudi.jujeop.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class OrderDao {
    Logger logger = LoggerFactory.getLogger(OrderDao.class);

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate = null;

    //무통장입금 주문
    public int orderInsert(Map<String, Object> pMap) {
        logger.info("orderInsert");
        int result = 0;
        result = sqlSessionTemplate.insert("orderInsert", pMap);
        return result;
    }

    //무통장입금 주문
    public int payInsert1(Map<String, Object> pMap) {
        logger.info("payInsert1");
        int result = 0;
        result = sqlSessionTemplate.insert("payInsert1", pMap);
        return result;
    }

    // 주문내역리스트조회
    public List<Map<String, Object>> orderInfo(Map<String, Object> pMap) {
        logger.info("orderInfo 호출");
        List<Map<String, Object>> order = null;
        order = sqlSessionTemplate.selectList("orderInfo", pMap);
        return order;
    }
    // 배송지정보조회(유저테이블)
    public List<Map<String, Object>> userInfo(Map<String, Object> pMap) {
        logger.info("userInfo 호출");
        List<Map<String, Object>> order = null;
        order = sqlSessionTemplate.selectList("userInfo", pMap);
        return order;
    }
    
    public int deleteOrder(Map<String, Object> pMap) {
        logger.info("deleteOrder");
		int result = 0;
		result = sqlSessionTemplate.delete("deleteOrder", pMap);
        return result;
    }

    public int deletePay(Map<String, Object> pMap) {
        logger.info("deletePay");
		int result = 0;
		result = sqlSessionTemplate.delete("deletePay", pMap);
        return result;
    }

    public int cartDeleteAll(Map<String, Object> pMap) {
         logger.info("cartDeleteAll");
		int result = 0;
		result = sqlSessionTemplate.delete("cartDeleteAll", pMap);
        return result;
    }
}
