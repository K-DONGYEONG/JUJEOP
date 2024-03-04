package com.gudi.jujeop.logic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gudi.jujeop.dao.AdminDao;

@Service
public class AdminLogic {
        Logger logger = LoggerFactory.getLogger(AdminLogic.class);
        
  @Autowired
  private AdminDao adminDao = null;

public List<Map<String, Object>> adminMemberList(Map<String, Object> pMap) {
     logger.info("adminMemberList");
  List<Map<String, Object>> mList = null;
  mList = adminDao.adminMemberList(pMap);
  return mList;
}

public List<Map<String, Object>> memberOrderList(Map<String, Object> pMap) {
  logger.info("memberOrderList");
  List<Map<String,Object>> oList = null;
  oList = adminDao.memberOrderList(pMap);  
  return oList;
}

public int memberOrderDelete(int order_no) {
  logger.info("memberOrderDelete");
  int result = 0;
  result = adminDao.memberOrderDelete(order_no);
  return result;
}

public int memberPayDelete(int order_no) {
  logger.info("memberPayDelete");
  int result = 0;
  result = adminDao.memberPayDelete(order_no);
  return result;
}

/****************************************************************************************************************
 * 관리자가 상품목록 게시판을 관리하는 코드
 ****************************************************************************************************************/

public List<Map<String, Object>> adminProductList(Map<String, Object> pMap) {
  logger.info("adminProductList");
  List<Map<String, Object>> pList = null;
  pList = adminDao.adminProductList(pMap);
  return pList;
}

public int adminProductInsert(Map<String, Object> pMap) {
  logger.info("adminProductInsert");
  int result = -1;
  result = adminDao.adminProductInsert(pMap);
  return result;
}

public List<Map<String, Object>> adminProductDetailList(int product_no) {
     List<Map<String,Object>> pList = null;
  Map<String,Object> pMap = new HashMap<>();
  pMap.put("product_no", product_no);
  pList = adminDao.adminProductList(pMap);  
  return pList;
}

public int adminProductUpdate(Map<String, Object> pMap) {
    logger.info("adminProductUpdate");
  int result = -1;
  result = adminDao.adminProductUpdate(pMap);
  return result;
}

public int adminProductDelete(int product_no) {
    logger.info("adminProductDelete");
  int result = 0;
  result = adminDao.adminProductDelete(product_no);
  return result;
}
/****************************************************************************************************************
 * 관리자가 공지사항 게시판을 관리하는 코드
 ****************************************************************************************************************/

 public List<Map<String, Object>> adminNoticeList(Map<String, Object> pMap) {
   logger.info("adminNoticeList");
  List<Map<String, Object>> nList = null;
  nList = adminDao.adminNoticeList(pMap);
  return nList;
}

public List<Map<String, Object>> adminNoticeDetailList(int notice_no) {
   List<Map<String,Object>> nList = null;
  Map<String,Object> pMap = new HashMap<>();
  pMap.put("notice_no", notice_no);
  nList = adminDao.adminNoticeList(pMap);  
  return nList;
}

public int adminNoticeInsert(Map<String, Object> pMap) {
  logger.info("adminNoticeInsert");
  int result = -1;
  result = adminDao.adminNoticeInsert(pMap);
  return result;
}

public int adminNoticeUpdate(Map<String, Object> pMap) {
  logger.info("adminNoticeUpdate");
  int result = -1;
  result = adminDao.adminNoticeUpdate(pMap);
  return result;
} 

public int adminNoticeDelete(int notice_no) {
   logger.info("adminNoticeDelete");
  int result = 0;
  result = adminDao.adminNoticeDelete(notice_no);
  return result;
}

/****************************************************************************************************************
 * 관리자가 QnA게시판을 관리하는 코드
 ****************************************************************************************************************/


public List<Map<String, Object>> adminQnaList(Map<String, Object> pMap) {
  logger.info("adminQnaList");
  List<Map<String, Object>> qList = null;
  qList = adminDao.adminQnaList(pMap);
  return qList;
}

public List<Map<String, Object>> adminQnaDetailList(int qna_no) {
  List<Map<String,Object>> qList = null;
  Map<String,Object> pMap = new HashMap<>();
  pMap.put("qna_no", qna_no);
  qList = adminDao.adminQnaList(pMap);  
 int result = 0;
 result = qList.size(); 
  if(result == 1) { 
    adminDao.hitCount(qna_no);
  }
  return qList;
}

public int adminQnaDelete(int c_no) {
  logger.info("adminQnaDelete");
  int result = 0;
  result = adminDao.adminQnaDelete(c_no);
  return result;
}

public int adminQnaCommentInsert(Map<String, Object> pMap) {
  logger.info("adminQnaCommentInsert");
  int result = -1;
  result = adminDao.adminQnaCommentInsert(pMap);
  return result;
}

}
