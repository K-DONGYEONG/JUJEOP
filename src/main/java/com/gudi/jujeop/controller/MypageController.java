package com.gudi.jujeop.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gudi.jujeop.logic.MypageLogic;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
    Logger logger = LoggerFactory.getLogger(MypageController.class);
    @Autowired
    private MypageLogic mypageLogic = null;

    //로그인한 회원의 정보를 가져오는 메소드
	public Map<String, Object> member(String user_no) {
		Map<String, Object> member = mypageLogic.member(user_no);
		return member;
	}
    //회원정보
    @PostMapping("memberInfo")
    @ResponseBody
    public Map<String, Object> memberInfo(@RequestParam Map<String,Object> pMap, Model model) { 
        logger.info("마이페이지 조회");
        
        Map<String, Object> member = member(pMap.get("user_no").toString());
        model.addAttribute("member2", member);
        model.addAttribute("msg", "조회완료!");
        logger.info("마이페이지 조회(결과)"+model);
        return member;
        //return "forward:mypage.jsp"; 
    }

    //회원정보수정
    @PostMapping("memberUpdate")
    public String memberUpdate(HttpSession session, @RequestParam Map<String, Object> pMap) {
        try {
            logger.info("회원정보 수정 시도: " + pMap);
            mypageLogic.memberUpdate(pMap);
            
            session.setAttribute("msg", "회원정보 수정이 완료되었습니다.");
            
            // 성공/실패 여부와 상관없이 마이페이지로 리다이렉트
            return "redirect:./mypage.jsp";
        } catch (Exception e) {
            logger.error("회원정보 수정 중 오류 발생: ", e);
            session.setAttribute("errorMsg", "회원정보 수정 중 오류가 발생했습니다.");
            // 에러 메시지를 JavaScript를 통해 alert로 표시
            return "redirect:./mypageerror.jsp"; 
        }
    }
    
    //배송지수정
    @PostMapping("addressUpdate")
    public String addressUpdate(HttpSession session, @RequestParam Map<String, Object> pMap) {
        try {
            logger.info("배송지 수정 시도: " + pMap);
            mypageLogic.addressUpdate(pMap);
            
            session.setAttribute("msg", "배송지 수정이 완료되었습니다.");
            
            // 성공/실패 여부와 상관없이 마이페이지로 리다이렉트
            return "redirect:./mypage.jsp";
        } catch (Exception e) {
            logger.error("배송지 수정 중 오류 발생: ", e);
            session.setAttribute("errorMsg", "배송지 수정 중 오류가 발생했습니다.");
            // 에러 메시지를 JavaScript를 통해 alert로 표시
            return "redirect:./mypageerror.jsp"; 
        }
    }
    //주문정보
    @PostMapping("orderList")
    @ResponseBody
    public List<Map<String, Object>> orderList(@RequestParam Map<String,Object> pMap, Model model, HttpServletRequest req) { 
        logger.info("주문정보 마이페이지 화면 출력");
        List<Map<String, Object>> orderList = null;
        orderList = mypageLogic.orderList(pMap);
        model.addAttribute("orderList", orderList);
        return orderList;//"forward:mypage.jsp"; 
    }

    //배송지정보
    @GetMapping("addressList")
    public String addressList(@RequestParam Map<String,Object> pMap, Model model, HttpServletRequest req) { 
        logger.info("배송지 정보 마이페이지 화면 출력");
        List<Map<String, Object>> aList = null;
        aList = mypageLogic.addressList(pMap);
        model.addAttribute("aList", aList);
        return "forward:mypage.jsp"; 
    }
}    