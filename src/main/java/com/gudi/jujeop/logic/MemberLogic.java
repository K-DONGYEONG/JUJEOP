package com.gudi.jujeop.logic;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gudi.jujeop.dao.MemberDao;

@Service
public class MemberLogic {
    Logger logger = LoggerFactory.getLogger(MemberLogic.class);
    
  @Autowired
  private MemberDao memberDao = null;

  // 회원 가입
  public int register(Map<String, Object> pMap) {
    int result = 0;
    try {
        result = memberDao.register(pMap); // 회원 정보를 데이터베이스에 넣음
    } catch (Exception e) {
        logger.error("회원 가입 실패: " + e.getMessage());
        e.printStackTrace();
    }
    return result;
  }

  // 로그인
	public int login(Map<String, Object> pMap)
	{
		int result = memberDao.login(pMap);
		return result;
	}
  
	public Map<String, Object> member(String user_id)
	{
		Map<String, Object> member =  memberDao.member(user_id);
		return member;
	}
}
