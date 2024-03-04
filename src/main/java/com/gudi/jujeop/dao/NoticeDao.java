package com.gudi.jujeop.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDao {
     Logger logger = LoggerFactory.getLogger(NoticeDao.class);
     
     @Autowired
	private SqlSessionTemplate sqlSessionTemplate = null;

    public int hitCount(int notice_no) {
     logger.info("noticehitCount");
     int result = -1;
     result = sqlSessionTemplate.insert("noticehitCount", notice_no);
     return result;
    }

    public List<Map<String, Object>> noticeList(Map<String, Object> pMap) {
     logger.info("noticeList 호출");
     List<Map<String, Object>> nList = null;
     nList = sqlSessionTemplate.selectList("noticeList", pMap);
     return nList;
    }
}
