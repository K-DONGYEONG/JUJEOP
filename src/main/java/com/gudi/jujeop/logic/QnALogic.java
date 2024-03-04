package com.gudi.jujeop.logic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gudi.jujeop.dao.QnADao;

@Service
public class QnALogic {
  Logger logger = LoggerFactory.getLogger(QnALogic.class);

  @Autowired
  private QnADao qnaDao = null;

  public List<Map<String, Object>> qnaList(Map<String, Object> pMap) {
    logger.info(pMap.toString());
    List<Map<String, Object>> qList = null;
    qList = qnaDao.qnaList(pMap);
    return qList;
  }

  public List<Map<String, Object>> qnaDetail(int qna_no) {
    List<Map<String, Object>> qList = null;
    Map<String, Object> pMap = new HashMap<>();
    pMap.put("qna_no", qna_no);
    int result = 0;
    qList = qnaDao.qnaList(pMap);
    result = qList.size();
    if (result == 1) {// 한건 조회가 성공했다
      qnaDao.hitCount(qna_no);
    }

    return qList;
  }

  public int qnaInsert(Map<String, Object> pMap) {
    logger.info("qnaInsert");
    int result = -1;
    result = qnaDao.qnaInsert(pMap);
    return result;
  }

  public int qnaInsert2(Map<String, Object> pMap) {
    logger.info("qnaInsert2");
    int result = -1;
    result = qnaDao.qnaInsert2(pMap);
    return result;
  }

  public int qnaUpdate(Map<String, Object> pMap) {
    logger.info("qnaUpdate");
    int result = -1;
    result = qnaDao.qnaUpdate(pMap);
    return result;
  }

  public int qnaDelete(int qna_no) {
    logger.info("qnaDelete");
    int result = 0;
    result = qnaDao.qnaDelete(qna_no);
    return result;
  }

public int qnaCommentDelete(int qna_no) {
    int result = 0;
    result = qnaDao.qnaCommentDelete(qna_no);
    return result;
}
}
