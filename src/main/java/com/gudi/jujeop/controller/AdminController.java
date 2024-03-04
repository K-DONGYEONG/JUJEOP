package com.gudi.jujeop.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gudi.jujeop.dao.AdminDao;
import com.gudi.jujeop.logic.AdminLogic;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
    final String projectPath = "C:/Users/kdy/Desktop/JUJEOP/jujeop/src/main/webapp/image";
    Logger logger = LoggerFactory.getLogger(AdminController.class);
    @Autowired
    private AdminLogic adminLogic = null;
    @Autowired
    private AdminDao adminDao = null;

    /****************************************************************************************************************
     * 관리자가 회원을 관리하는 코드
     ****************************************************************************************************************/

    //사용자 목록 출력되는 화면
    @GetMapping("adminMemberList")
    public String adminMemberList(@RequestParam Map<String,Object> pMap, Model model) { 
        List<Map<String,Object>> mList = adminLogic.adminMemberList(pMap);
        model.addAttribute("mList", mList);
        return "forward:adminMemberList.jsp";
    }

    //회원별 주문목록 출력되는 화면
    @GetMapping("memberOrderList")
       public String memberOrderList(@RequestParam Map<String,Object> pMap, Model model) { 
            logger.info("memberOrderList 호출 " );
            List<Map<String, Object>> oList = adminLogic.memberOrderList(pMap);
            model.addAttribute("oList", oList);
            return "forward:memberOrderList.jsp";
    }

    //회원별 주문목록을 삭제하는 코드
     @GetMapping("memberOrderDelete")
     public String memberOrderDelete(int order_no) { 
     int result = 0;
    result = adminLogic.memberOrderDelete(order_no);
    adminLogic.memberPayDelete(order_no);
    
    return "redirect:adminMemberList";
     }

    /****************************************************************************************************************
     * 관리자가 상품을 관리하는 코드
     ****************************************************************************************************************/

    //관리자가 상품을 등록한 내용 출력되는 화면
    @GetMapping("adminProductList")
    public String adminProductList(@RequestParam Map<String,Object> pMap, Model model) { 
        List<Map<String,Object>> pList = adminLogic.adminProductList(pMap);
        model.addAttribute("pList", pList);
        return "forward:adminProductList.jsp";
    }

    //관리자가 상품 상세내용을 출력하는 코드
    @GetMapping("adminProductDetailList")
        public String adminProductDetailList(int product_no, Model model) { 
            logger.info("adminProductDetailList 호출 " + product_no);
            List<Map<String, Object>> pList = adminLogic.adminProductDetailList(product_no);
            model.addAttribute("pList", pList);
            return "forward:adminProductDetailList.jsp";
    }

        //관리자가 상품을 수정하는 코드
        @PostMapping("adminProductUpdate")
        public String adminProductUpdate(@RequestParam Map<String,Object> pMap) { 
         int result = 0;
        result = adminLogic.adminProductUpdate(pMap);
        return "redirect:adminProductList";
    }

    //관리자가 상품을 삭제하는 코드
    @GetMapping("adminProductDelete")
     public String adminProductDelete(int product_no) { 
    logger.info("product_no : " + product_no);
     int result = 0;
    result = adminLogic.adminProductDelete(product_no);
    return "redirect:adminProductList";
     }
  
     //관리자가 상품을 등록하는 코드(이미지 등록)
	@PostMapping("adminFileInsert")
	public String uploadFileWithParams(@RequestParam Map<String, String> params,
			@RequestParam("file") MultipartFile file)
	{
		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
        String filePath = "/image/" + fileName;
		File dest = new File(projectPath, fileName);
		try
		{
			file.transferTo(dest);
			params.put("product_image", filePath);
			int result = adminDao.Insert(params);
		}
		catch (IllegalStateException | IOException e)
		{
			e.printStackTrace();
		}
		return "redirect:adminProductList";
	}

    /****************************************************************************************************************
     * 관리자가 공지사항을 관리하는 코드
     ****************************************************************************************************************/

    //관리자가 공지사항을 출력하는 화면
    @GetMapping("adminNoticeList")
        public String adminNoticeList(@RequestParam Map<String,Object> pMap, Model model) { 
        List<Map<String,Object>> nList = adminLogic.adminNoticeList(pMap);
        model.addAttribute("nList", nList);
        return "forward:adminNoticeList.jsp";
    }

    //관리자가 공지사항 상세내용을 출력하는 코드
    @GetMapping("adminNoticeDetailList")
        public String adminNoticeDetailList(int notice_no, Model model) { 
            logger.info("adminNoticeDetailList 호출 " + notice_no);
            List<Map<String, Object>> nList = adminLogic.adminNoticeDetailList(notice_no);
            model.addAttribute("nList", nList);
            return "forward:adminNoticeDetailList.jsp";
    }

    //관리자가 공지사항을 입력하는 코드
    @PostMapping("adminNoticeInsert")
    public String adminNoticeInsert(@RequestParam Map<String,Object> pMap) { 
        logger.info("공지사항 등록");
        int result = -1;    
        result = adminLogic.adminNoticeInsert(pMap);
        return "redirect:adminNoticeList";
    } 

    //관리자가 공지사항을 수정하는 코드
        @PostMapping("adminNoticeUpdate")
        public String adminNoticeUpdate(@RequestParam Map<String,Object> pMap) { 
        int result = 0;
        result = adminLogic.adminNoticeUpdate(pMap);
        return "redirect:adminNoticeList";
    }

    //관리자가 공지사항을 삭제하는 코드
     @GetMapping("adminNoticeDelete")
        public String adminNoticeDelete(int notice_no) { 
            logger.info("notice_no : " + notice_no);
            int result = 0;
            result = adminLogic.adminNoticeDelete(notice_no);
            return "redirect:adminNoticeList";
        }
  

    /****************************************************************************************************************
     * 관리자가 QnA게시판을 관리하는 코드
     ****************************************************************************************************************/

    //관리자가 QnA게시판을 출력하는 화면
        @GetMapping("adminQnaList")
        public String adminQnaList(@RequestParam Map<String,Object> pMap, Model model) { 
        List<Map<String,Object>> qList = adminLogic.adminQnaList(pMap);
        model.addAttribute("qList", qList);
        return "forward:adminQnaList.jsp";
    }

        //관리자가 QnA상세보기 출력하는 화면
        @GetMapping("adminQnaDetailList")
        public String adminQnaDetailList(int qna_no, Model model) { 
            logger.info("adminQnaDetailList 호출 " + qna_no);
            List<Map<String, Object>> qList = adminLogic.adminQnaDetailList(qna_no);
            model.addAttribute("qList", qList);
            return "forward:adminQnaDetailList.jsp";
    }

        //관리자가 QnA 답글을 삭제하는 코드
        @GetMapping("adminQnaDelete")
        public String adminQnaDelete(int c_no) { 
            logger.info("c_no : " + c_no);
            int result = 0;
            result = adminLogic.adminQnaDelete(c_no);
            return "redirect:adminQnaList";
        }

        //관리자가 QnA답글을 쓰는 코드
        @PostMapping("adminQnaCommentInsert")
        public String adminQnaCommentInsert(@RequestParam Map<String,Object> pMap) { 
        logger.info("QnA 답글 등록");
        int result = -1;    
        result = adminLogic.adminQnaCommentInsert(pMap);
        return "redirect:adminQnaList";
}
}