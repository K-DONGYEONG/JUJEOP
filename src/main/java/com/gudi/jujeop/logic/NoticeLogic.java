package com.gudi.jujeop.logic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gudi.jujeop.dao.NoticeDao;

@Service
public class NoticeLogic {
    Logger logger = LoggerFactory.getLogger(NoticeLogic.class);
    
  @Autowired
  private NoticeDao noticeDao = null;

public List<Map<String, Object>> noticeList(Map<String, Object> pMap) {
  logger.info("noticeList");
  List<Map<String, Object>> nList = null;
  nList = noticeDao.noticeList(pMap);
  return nList;
}

public List<Map<String, Object>> noticeDetailList(int notice_no) {
    List<Map<String,Object>> nList = null;
  Map<String,Object> pMap = new HashMap<>();
  pMap.put("notice_no", notice_no);
  nList = noticeDao.noticeList(pMap);  
 int result = 0;
 result = nList.size(); 
  if(result == 1) { 
    noticeDao.hitCount(notice_no);
  }
  return nList;
} 
}
