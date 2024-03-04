package com.gudi.jujeop.logic;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gudi.jujeop.dao.MypageDao;

@Service
public class MypageLogic {
  Logger logger = LoggerFactory.getLogger(MypageLogic.class); 

  @Autowired
  private MypageDao mypageDao = null; 

    //회원정보수정
    public int memberUpdate(Map<String, Object> pMap) {
      logger.info("memberUpdate");
      int result = mypageDao.memberUpdate(pMap);
      return result;
    }
    //배송지수정
    public int addressUpdate(Map<String, Object> pMap) {
      logger.info("addressUpdate");
      int result = mypageDao.addressUpdate(pMap);
      return result;
    }
    
    //회원정보조회
    public Map<String, Object> member(String user_no)
    {
      Map<String, Object> member =  mypageDao.memberList(user_no);
      return member;
    }
    //주문목록조회  
    public List<Map<String, Object>> orderList(Map<String, Object> pMap) {
      logger.info("orderList");
      List<Map<String, Object>> oList = null;
      oList = mypageDao.orderList(pMap);
      return oList;
    }
    //배송지목록조회
    public List<Map<String, Object>> addressList(Map<String, Object> pMap) {
      logger.info("addressList");
      List<Map<String, Object>> aList = null;
      aList = mypageDao.addressList(pMap);
      return aList;
    }
}