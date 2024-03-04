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

import com.gudi.jujeop.logic.CartLogic;
import com.gudi.jujeop.logic.OrderLogic;

@Controller
@RequestMapping("/order/*")
public class OrderController {
    Logger logger = LoggerFactory.getLogger(OrderController.class);
    @Autowired
    private OrderLogic orderLogic = null;

    @Autowired
    private CartLogic cartLogic = null;

    //무통장으로 결제시
	@PostMapping("payInsert1")
	public String payInsert1(@RequestParam Map<String, Object> pMap){
		logger.info("무통장으로 입금할거야?");

        orderLogic.payInsert1(pMap);
        orderLogic.cartDeleteAll(pMap);
        
		return "redirect:./order.jsp";
	}

    //무통장으로 결제시
	@PostMapping("orderInsert")
	public String orderInsert(@RequestParam Map<String, Object> pMap){
		logger.info("무통장으로 입금할거야?");
        
        orderLogic.orderInsert(pMap);

		return "redirect:./order.jsp";
	}

    //주문정보
    @PostMapping("orderInfo")
    @ResponseBody
    public List<Map<String, Object>> orderInfo(@RequestParam Map<String,Object> pMap, Model model, HttpServletRequest req) { 
        logger.info("주문정보 상세 화면 출력");
        List<Map<String, Object>> orderInfo = null;
        orderInfo = orderLogic.orderInfo(pMap);
        model.addAttribute("orderInfo", orderInfo);
        return orderInfo;//"forward:mypage.jsp"; 
    }

    //배송지정보-유저테이블
    @PostMapping("userInfo")
    @ResponseBody
    public List<Map<String, Object>> userInfo(@RequestParam Map<String,Object> pMap, Model model, HttpServletRequest req) { 
        logger.info("배송지정보 화면 출력");
        List<Map<String, Object>> userInfo = null;
        userInfo = orderLogic.userInfo(pMap);
        model.addAttribute("userInfo", userInfo);
        return userInfo;//"forward:mypage.jsp"; 
    }
    //주문내역삭제
    @PostMapping("deleteOrder")
    public String deleteOrder(HttpSession session, @RequestParam Map<String, Object> pMap) {
        try {
            logger.info("주문내역 삭제 시도: " + pMap);
            
            orderLogic.deleteOrder(pMap);
            orderLogic.deletePay(pMap);

            session.setAttribute("msg", "주문내역 삭제가 완료되었습니다.");

            // 성공/실패 여부와 상관없이 마이페이지로 리다이렉트
            return "redirect:./orderDetail.jsp";//"redirect:mypage/mypage.jsp";
        } catch (Exception e) {
            logger.error("주문내역 삭제 중 오류 발생: ", e);
            session.setAttribute("errorMsg", "주문내역 삭제 중 오류가 발생했습니다.");
            // 에러 메시지를 JavaScript를 통해 alert로 표시
            return  "redirect:./orderDetail.jsp";//"redirect:mypage/mypageerror.jsp"; 
        }
    }
    
    /* 장바구니에서 주문하기 눌렀을시 주문페이지 포워딩 */
    @GetMapping("orderCartList")
    public String orderCartList(int user_no, Model model) { 
        logger.info("orderCartList 호출 " + user_no);
        List<Map<String, Object>> cList = cartLogic.cartList(user_no);
        model.addAttribute("cList", cList);
        return "forward:orderCartList.jsp";
}
}