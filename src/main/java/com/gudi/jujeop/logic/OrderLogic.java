package com.gudi.jujeop.logic;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gudi.jujeop.dao.OrderDao;

@Service
public class OrderLogic {
  Logger logger = LoggerFactory.getLogger(OrderLogic.class);
  
  @Autowired(required = false)
  private OrderDao orderDao = null; 

  //무통장입금 주문
  public int orderInsert(Map<String, Object> pMap) {
    logger.info("orderInsert");
    int result = 0;
    result = orderDao.orderInsert(pMap); 
    return result;
  } 

  //무통장입금 주문
  public int payInsert1(Map<String, Object> pMap) {
    logger.info("payInsert1");
    int result = 0;
    result = orderDao.payInsert1(pMap); 
    return result;
  } 

  //주문정보조회  
  public List<Map<String, Object>> orderInfo(Map<String, Object> pMap) {
    logger.info("orderInfo");
    List<Map<String, Object>> orderInfo = null;
    orderInfo = orderDao.orderInfo(pMap);
    return orderInfo;
  }

  //주문정보- 배송지정보조회(유저테이블)
  public List<Map<String, Object>> userInfo(Map<String, Object> pMap) {
    logger.info("userInfo");
    List<Map<String, Object>> userInfo = null;
    userInfo = orderDao.userInfo(pMap);
    return userInfo;
  }

  // 주문 삭제
  public int deleteOrder(Map<String, Object> pMap) {
    logger.info("deleteOrder");
    int result = 0;
    result = orderDao.deleteOrder(pMap);
    return result;
  }

  public int deletePay(Map<String, Object> pMap) {
    logger.info("deletePay");
    int result = 0;
    result = orderDao.deletePay(pMap);
    return result;
  }

  public int cartDeleteAll(Map<String, Object> pMap) {
     logger.info("cartDeleteAll");
    int result = 0;
    result = orderDao.cartDeleteAll(pMap);
    return result;
  }
}
