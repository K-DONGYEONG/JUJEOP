package com.gudi.jujeop.dao;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDao {
    Logger logger = LoggerFactory.getLogger(CartDao.class);
	
    @Autowired
	private SqlSessionTemplate sqlSessionTemplate = null;

    public List<Map<String, Object>> cartList(Map<String, Object> pMap) {
        logger.info("cartList 호출");
        logger.info(pMap.toString());
		List<Map<String, Object>> cList = null;
		cList = sqlSessionTemplate.selectList("cartList", pMap);
		return cList;
    }
    public List<Map<String, Object>> cartList2(Map<String, Object> pMap) {
        logger.info("cartList 호출");
        logger.info(pMap.toString());
		List<Map<String, Object>> cList = null;
		cList = sqlSessionTemplate.selectList("cartList2", pMap);
		return cList;
    }

 public int cartInsert(Map<String, Object> pMap) {
         logger.info("cartInsert");
		int result = -1;
		result = sqlSessionTemplate.insert("cartInsert", pMap);
        return result;
    } 

public int cartDelete(int cart_no) {
        logger.info("cartDelete");
		int result = 0;
		result = sqlSessionTemplate.delete("cartDelete", cart_no);
        return result;
    }
}