package com.gudi.jujeop.logic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gudi.jujeop.dao.CartDao;

@Service
public class CartLogic {
     Logger logger = LoggerFactory.getLogger(CartLogic.class);
@Autowired
  private CartDao cartDao = null;

/* 
public List<Map<String, Object>> cartList(Map<String, Object> pMap) {
  List<Map<String,Object>> cList = null;
  cList = cartDao.cartList(pMap);  
  return cList;
} */

public List<Map<String, Object>> cartList(int user_no) {
  List<Map<String,Object>> cList = null;
  Map<String,Object> pMap = new HashMap<>();
  pMap.put("user_no", user_no);
  cList = cartDao.cartList(pMap);  
  return cList;
}


public int cartInsert(Map<String, Object> pMap) {
     logger.info("cartInsert");
    int result = -1;
    result = cartDao.cartInsert(pMap);
    return result;
}

public int cartDelete(int cart_no) {
  logger.info("cartDelete");
  int result = 0;
  result = cartDao.cartDelete(cart_no);
  return result;
}
}