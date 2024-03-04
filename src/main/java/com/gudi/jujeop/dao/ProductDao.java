package com.gudi.jujeop.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDao {
     Logger logger = LoggerFactory.getLogger(ProductDao.class);

     @Autowired
     private SqlSessionTemplate sqlSessionTemplate = null;

     public List<Map<String, Object>> productList(Map<String, Object> pMap) {
       logger.info("productList 호출");
       List<Map<String, Object>> pList = null;
       pList = sqlSessionTemplate.selectList("productList", pMap);
       return pList;
     }

     public List<Map<String, Object>> productBest(Map<String, Object> pMap) {
      logger.info("productBest 호출");
      List<Map<String, Object>> pList = null;
      pList = sqlSessionTemplate.selectList("productBest", pMap);
      return pList;
   }

   public List<Map<String, Object>> productNew(Map<String, Object> pMap) {
      logger.info("productNew 호출");
      List<Map<String, Object>> pList = null;
      pList = sqlSessionTemplate.selectList("productNew", pMap);
      return pList;
   }

     public int productInsert(Map<String, Object> pMap) {
       logger.info("productInsert");
	  int result = -1;
	  result = sqlSessionTemplate.insert("productInsert", pMap);
       return result;
     }

    public int productUpdate(int product_no) {
       logger.info("productUpdate");
       int result = -1;
       result = sqlSessionTemplate.update("productUpdate", product_no);
       return result;
    }

    public int productDelete(int product_no) {
       logger.info("productDelete");
       int result = -1;
       result = sqlSessionTemplate.delete("productDelete", product_no);
       return result;
    }

    public List<Map<String, Object>> productDetail(Map<String, Object> pMap) {
       logger.info("productDetail");
       List<Map<String, Object>> pList = null;
       pList = sqlSessionTemplate.selectList("productDetail", pMap);
       return pList;
  }

    public List<Map<String, Object>> productTak(Map<String, Object> pMap) {
      logger.info("productTak 호출");
      List<Map<String, Object>> pList = null;
      pList = sqlSessionTemplate.selectList("productTak", pMap);
      return pList;
    }

    public List<Map<String, Object>> productYak(Map<String, Object> pMap) {
      logger.info("productYak 호출");
      List<Map<String, Object>> pList = null;
      pList = sqlSessionTemplate.selectList("productYak", pMap);
      return pList;
    }

    public List<Map<String, Object>> productGwa(Map<String, Object> pMap) {
      logger.info("productGwa 호출");
      List<Map<String, Object>> pList = null;
      pList = sqlSessionTemplate.selectList("productGwa", pMap);
      return pList;
    }

    public List<Map<String, Object>> productJeung(Map<String, Object> pMap) {
      logger.info("productJeung 호출");
      List<Map<String, Object>> pList = null;
      pList = sqlSessionTemplate.selectList("productJeung", pMap);
      return pList;
    }

    public List<Map<String, Object>> productSearch(String product_name) {
      logger.info("productSearch 호출");
      List<Map<String, Object>> pList = sqlSessionTemplate.selectList("productSearch", product_name);
      return pList;
   }
  
}
