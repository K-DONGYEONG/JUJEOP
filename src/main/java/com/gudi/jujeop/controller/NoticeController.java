package com.gudi.jujeop.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gudi.jujeop.logic.NoticeLogic;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
 Logger logger = LoggerFactory.getLogger(AdminController.class);
    @Autowired
    private NoticeLogic noticeLogic = null;

    //회원이 공지사항 목록 출력하는 코드
    @GetMapping("noticeList")
        public String noticeList(@RequestParam Map<String,Object> pMap, Model model) { 
        List<Map<String,Object>> nList = noticeLogic.noticeList(pMap);
        model.addAttribute("nList", nList);
        return "forward:noticeList.jsp";
    }

    //회원이 공지사항 상세내용을 출력하는 코드
    @GetMapping("noticeDetailList")
        public String noticeDetailList(int notice_no, Model model) { 
            logger.info("noticeDetailList 호출 " + notice_no);
            List<Map<String, Object>> nList = noticeLogic.noticeDetailList(notice_no);
            model.addAttribute("nList", nList);
            return "forward:noticeDetailList.jsp";
    }
}
