package com.gudi.jujeop.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MypageDao {
  Logger logger = LoggerFactory.getLogger(MypageDao.class);

  @Autowired
	private SqlSessionTemplate sqlSessionTemplate = null;   

  // 회원정보조회  
  public Map<String, Object> memberList(String user_no) {
		Map<String, Object> member = sqlSessionTemplate.selectOne("memberList",user_no);
		return member;
	}

  // 회원정보수정
	public int memberUpdate(Map<String, Object> pMap) {
    logger.info("memberUpdate 호출");
		return sqlSessionTemplate.update("memberUpdate", pMap);
	}
  // 배송지수정
	public int addressUpdate(Map<String, Object> pMap) {
    logger.info("addressUpdate 호출");
		return sqlSessionTemplate.update("addressUpdate", pMap);
	}
  
  // 주문내역리스트조회
  public List<Map<String, Object>> orderList(Map<String, Object> pMap) {
    logger.info("orderList 호출");
    List<Map<String, Object>> oList = null;
    oList = sqlSessionTemplate.selectList("orderList", pMap);
    return oList;
  }
  // 배송지리스트조회 
  public List<Map<String, Object>> addressList(Map<String, Object> pMap) {
    logger.info("addressList 호출");
    List<Map<String, Object>> aList = null;
    aList = sqlSessionTemplate.selectList("addressList", pMap);
    return aList;
  }
}