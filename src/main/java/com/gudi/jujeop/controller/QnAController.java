package com.gudi.jujeop.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gudi.jujeop.logic.QnALogic;

@Controller // 컨트롤 클래스 선언시 사용함
@RequestMapping("/qna/*")
public class QnAController {
    Logger logger = LoggerFactory.getLogger(QnAController.class);

    @Autowired
    private QnALogic qnALogic = null;

    @GetMapping("qnaList")
    public String qnaList(@RequestParam Map<String, Object> pMap, Model model) {
        logger.info("qnaList 호출");
        List<Map<String, Object>> qList = null;
        qList = qnALogic.qnaList(pMap);
        model.addAttribute("qList", qList);
        return "forward:qnaList.jsp";
    }

    @GetMapping("qnaDetail")
    public String qnaDetail(int qna_no, Model model) {
        logger.info("qnaDetail" + qna_no);
        List<Map<String, Object>> qList = null;
        qList = qnALogic.qnaDetail(qna_no);
        model.addAttribute("qList", qList);
        return "forward:qnaDetail.jsp";
    }

    @PostMapping("qnaInsert")
    public String qnaInsert(@RequestParam Map<String, Object> pMap) {
        logger.info("qnaInsert 호출");
        int result = -1;
        result = qnALogic.qnaInsert(pMap);
        logger.info("result!!" + result);
        return "redirect:qnaList";
    }

    @PostMapping("qnaInsert2")
    public String qnaInsert2(@RequestParam Map<String, Object> pMap) {
        logger.info("qnaInsert2 호출");
        int result = -1;// 1이면 등록 성공, 0이면 실패
        result = qnALogic.qnaInsert2(pMap);
        logger.info("result!!" + result);
        return "redirect:qnaList";
    }

    @PostMapping("qnaUpdate")
    public String qnaUpdate(@RequestParam Map<String, Object> pMap) {
        logger.info("qnaUpdate 호출");
        int result = -1;
        result = qnALogic.qnaUpdate(pMap);
        logger.info("result!!" + result);
        return "redirect:qnaList";
    }

    @GetMapping("qnaDelete")
    public String qnaDelete(int qna_no) {
        logger.info("qnaDelete 호출");
        logger.info("qna_no : " + qna_no);
        int result = 0;
        result = qnALogic.qnaDelete(qna_no);
        qnALogic.qnaCommentDelete(qna_no);
        logger.info("result!!" + result);
        return "redirect:qnaList";
    }
}
