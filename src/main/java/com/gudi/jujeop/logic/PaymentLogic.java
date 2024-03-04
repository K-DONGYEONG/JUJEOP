package com.gudi.jujeop.logic;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gudi.jujeop.dao.PaymentDao;

@Service
public class PaymentLogic {
  Logger logger = LoggerFactory.getLogger(PaymentLogic.class);
  
  @Autowired
  private PaymentDao paymentDao = null;

  public int kakaoInsert(Map<String, Object> pMap) {
    logger.info("kakaoInsert");
    int result = -1;
    result = paymentDao.kakaoInsert(pMap); 
    return result;
  }

public int payInsert(Map<String, Object> pMap) {
  logger.info("payInsert");
  int result = -1;
  result = paymentDao.payInsert(pMap); 
  return result;
} 
}
