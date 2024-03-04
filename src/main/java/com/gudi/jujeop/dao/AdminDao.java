package com.gudi.jujeop.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDao {
    
        Logger logger = LoggerFactory.getLogger(AdminDao.class);
	
    @Autowired(required = false)
	private SqlSessionTemplate sqlSessionTemplate = null;

    public List<Map<String, Object>> adminMemberList(Map<String, Object> pMap) {
        logger.info("adminMemberList 호출");
		List<Map<String, Object>> mList = null;
		mList = sqlSessionTemplate.selectList("adminMemberList", pMap);
		return mList;
    }
	public List<Map<String, Object>> memberOrderList(Map<String, Object> pMap) {
		logger.info("memberOrderList 호출");
		List<Map<String, Object>> oList = null;
			oList = sqlSessionTemplate.selectList("memberOrderList", pMap);
		return oList;
	}
		public int memberOrderDelete(int order_no) {
		logger.info("memberOrderDelete");
		int result = 0;
		result = sqlSessionTemplate.delete("memberOrderDelete", order_no);
        return result;
	}

		public int memberPayDelete(int order_no) {
		logger.info("memberPayDelete");
		int result = 0;
		result = sqlSessionTemplate.delete("memberPayDelete", order_no);
        return result;
	}


/****************************************************************************************************************
 * 관리자가 상품목록 게시판을 관리하는 코드
 ****************************************************************************************************************/

    public List<Map<String, Object>> adminProductList(Map<String, Object> pMap) {
        logger.info("adminProductList 호출");
		List<Map<String, Object>> pList = null;
		pList = sqlSessionTemplate.selectList("adminProductList", pMap);
		return pList;
    }

	public int adminProductUpdate(Map<String, Object> pMap) {
		logger.info("adminProductUpdate");
		int result = -1;
		result = sqlSessionTemplate.update("adminProductUpdate", pMap);
		return result;
	}

	public int adminProductDelete(int product_no) {
		 logger.info("adminProductDelete");
		int result = 0;
		result = sqlSessionTemplate.delete("adminProductDelete", product_no);
        return result;
	}
    public int adminProductInsert(Map<String, Object> pMap) {
        logger.info("adminProductInsert");
		int result = -1;
		result = sqlSessionTemplate.insert("adminProductInsert", pMap);
		return result;
    }
	
	public int Insert(Map<String, String> params)
	{
		logger.info("파일 업로드");
		int result = sqlSessionTemplate.insert("adminFileInsert", params);
		return result;
	}

/****************************************************************************************************************
 * 관리자가 공지사항 게시판을 관리하는 코드
 ****************************************************************************************************************/

    public List<Map<String, Object>> adminNoticeList(Map<String, Object> pMap) {
         logger.info("adminNoticeList 호출");
		List<Map<String, Object>> nList = null;
		nList = sqlSessionTemplate.selectList("adminNoticeList", pMap);
		return nList;
    }

    public int adminNoticeUpdate(Map<String, Object> pMap) {
		logger.info("adminNoticeUpdate");
		int result = -1;
		result = sqlSessionTemplate.update("adminNoticeUpdate", pMap);
		return result;
    }

	    public int adminNoticeInsert(Map<String, Object> pMap) {
        logger.info("adminNoticeInsert");
		int result = -1;
		result = sqlSessionTemplate.insert("adminNoticeInsert", pMap);
		return result;
    }

	public int adminNoticeDelete(int notice_no) {
		 logger.info("adminNoticeDelete");
		int result = 0;
		result = sqlSessionTemplate.delete("adminNoticeDelete", notice_no);
        return result;
	}
/****************************************************************************************************************
 * 관리자가 QnA 게시판을 관리하는 코드
 ****************************************************************************************************************/

    public List<Map<String, Object>> adminQnaList(Map<String, Object> pMap) {
         logger.info("adminQnaList 호출");
		List<Map<String, Object>> qList = null;
		qList = sqlSessionTemplate.selectList("adminQnaList", pMap);
		return qList;
    }

	public int hitCount(int qna_no) {
		logger.info("hitCount");
		logger.info("" + qna_no); 
		int result = -1;
		result = sqlSessionTemplate.insert("hitCount", qna_no);
		return result;
	}

    public int adminQnaDelete(int c_no) {
        logger.info("adminQnaDelete");
		int result = 0;
		result = sqlSessionTemplate.delete("adminQnaDelete", c_no);
        return result;
    }

    public int adminQnaCommentInsert(Map<String, Object> pMap) {
        logger.info("adminQnaCommentInsert");
		int result = -1;
		result = sqlSessionTemplate.insert("adminQnaCommentInsert", pMap);
		return result;
    }
}
