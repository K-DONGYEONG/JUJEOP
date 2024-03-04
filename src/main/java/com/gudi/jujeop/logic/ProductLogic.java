package com.gudi.jujeop.logic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gudi.jujeop.dao.ProductDao;

@Service
public class ProductLogic {
  Logger logger = LoggerFactory.getLogger(MemberLogic.class);

    @Autowired
    private ProductDao productDao = null;

    public List<Map<String, Object>> productList(Map<String, Object> pMap) {
      logger.info("productList");
      List<Map<String, Object>> pList = null;
      pList = productDao.productList(pMap);
      return pList;
    }

    public List<Map<String, Object>> productBest(Map<String, Object> pMap) {
      logger.info("productBest");
      List<Map<String, Object>> pList = null;
      pList = productDao.productBest(pMap);
      return pList;
    }

    public List<Map<String, Object>> productNew(Map<String, Object> pMap) {
      logger.info("productNew");
      List<Map<String, Object>> pList = null;
      pList = productDao.productNew(pMap);
      return pList;
    }

    public int productInsert(Map<String, Object> pMap) {
      logger.info("productInsert");
      int result = -1;
      result = productDao.productInsert(pMap);
      return result;
    }

    public int productUpdate(int product_no) {
      logger.info("productUpdate");
      int result = -1;
      result = productDao.productUpdate(product_no);
      return result;
    }

    public int productDelete(int product_no) {
      logger.info("productDelete");
      int result = -1;
      result = productDao.productDelete(product_no);
      return result;
    }

    public List<Map<String, Object>> productDetail(int product_no) {
      List<Map<String,Object>> pList = null;
      Map<String,Object> pMap = new HashMap<>();
      pMap.put("product_no", product_no);
      pList = productDao.productDetail(pMap);  
      return pList;
    }

    public List<Map<String, Object>> productTak(Map<String, Object> pMap) {
      logger.info("productTak");
      List<Map<String, Object>> pList = null;
      pList = productDao.productTak(pMap);
      return pList;
    }

    public List<Map<String, Object>> productYak(Map<String, Object> pMap) {
      logger.info("productYak");
      List<Map<String, Object>> pList = null;
      pList = productDao.productYak(pMap);
      return pList;
    }

    public List<Map<String, Object>> productGwa(Map<String, Object> pMap) {
      logger.info("productGwa");
      List<Map<String, Object>> pList = null;
      pList = productDao.productGwa(pMap);
      return pList;
    }

    public List<Map<String, Object>> productJeung(Map<String, Object> pMap) {
      logger.info("productJeung");
      List<Map<String, Object>> pList = null;
      pList = productDao.productJeung(pMap);
      return pList;
    }

    public List<Map<String, Object>> productSearch(String product_name) {
      logger.info("productSearch");
      List<Map<String, Object>> pList  = productDao.productSearch(product_name);
      return pList;
    }
}
