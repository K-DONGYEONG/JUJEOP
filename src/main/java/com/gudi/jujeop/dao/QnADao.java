package com.gudi.jujeop.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QnADao {
     Logger logger = LoggerFactory.getLogger(QnADao.class);

     @Autowired
     private SqlSessionTemplate sqlSessionTemplate = null;

     public List<Map<String, Object>> qnaList(Map<String, Object> pMap) {
          logger.info("qnaList 호출");
          List<Map<String, Object>> bList = null;
          bList = sqlSessionTemplate.selectList("tb_qnaList", pMap);
          return bList;
     }

     public int qnaInsert(Map<String, Object> pMap) {
          logger.info("qnaInsert");
          logger.info(pMap.toString());// 사용자가 입력한 값이 제대로 넘어왓는지 확인코드- 배달사고업무
          int result = -1;
          result = sqlSessionTemplate.insert("tb_qnaInsert", pMap);
          return result;
     }

     public int qnaInsert2(Map<String, Object> pMap) {
          logger.info("qnaInsert2");
          int result = -1;
          result = sqlSessionTemplate.insert("tb_qnaInsert2", pMap);
          return result;
     }

     public int hitCount(int qna_no) {
          logger.info("hitCount");
          logger.info("" + qna_no);// 사용자가 입력한 값이 제대로 넘어왔는지 확인코드-배달사고유무
          int result = -1;
          result = sqlSessionTemplate.insert("memberhitCount", qna_no);
          return result;
     }

     public int qnaUpdate(Map<String, Object> pMap) {
          logger.info("qnaUpdate");
          int result = -1;
          result = sqlSessionTemplate.update("tb_qnaUpdate", pMap);
          return result;
     }

     public int qnaDelete(int qna_no) {
          logger.info("qnaDelete");
          int result = 0;
          result = sqlSessionTemplate.delete("tb_qnaDelete", qna_no);
          return result;
     }

    public int qnaCommentDelete(int qna_no) {
          int result = 0;
          result = sqlSessionTemplate.delete("qnaCommentDelete", qna_no);
          return result;
    }

}