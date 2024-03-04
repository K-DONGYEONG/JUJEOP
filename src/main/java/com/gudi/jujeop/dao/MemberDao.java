package com.gudi.jujeop.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gudi.jujeop.vo.TbUserVO;

@Repository
public class MemberDao {
    Logger logger = LoggerFactory.getLogger(MemberDao.class);
	
    @Autowired
	private SqlSessionTemplate sqlSessionTemplate = null;

	// 회원 가입
	public int register(Map<String, Object> pMap) {
		return sqlSessionTemplate.insert("register", pMap);
	}

      //로그인
	public int login(Map<String, Object> pMap) {
		int result = sqlSessionTemplate.selectOne("login", pMap);
		return result;
	}

	//회원정보 가져오기
	public Map<String, Object> member(String user_id) {
		Map<String, Object> member = sqlSessionTemplate.selectOne("member",user_id);
		return member;
	}
}