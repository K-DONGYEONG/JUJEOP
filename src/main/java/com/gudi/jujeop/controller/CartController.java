package com.gudi.jujeop.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gudi.jujeop.logic.CartLogic;

@Controller
@RequestMapping("/cart/*")
public class CartController {
    Logger logger = LoggerFactory.getLogger(CartController.class);
    @Autowired
    private CartLogic cartLogic = null;

/****************************************************************************************************************
     * 장바구니 목록 구현
     * @param int user_no, Model model
     * @query : 
     *                   
     ****************************************************************************************************************/

    @GetMapping("cartList")
        public String cartList(int user_no, Model model) { 
            logger.info("cartList 호출 " + user_no);
            List<Map<String, Object>> cList = cartLogic.cartList(user_no);
            model.addAttribute("cList", cList);
            return "forward:cartList.jsp";
    }
/****************************************************************************************************************
     * 장바구니 추가 구현
     * @param Map<String,Object> pMap
     * @query : 
     *                   
     ****************************************************************************************************************/

    @GetMapping("cartInsert")
    public String cartInsert(@RequestParam Map<String,Object> pMap, HttpSession session) { 
        logger.info("장바구니 추가");
        Map<String, Object> member = (Map<String, Object>) session.getAttribute("member");
		int result = cartLogic.cartInsert(pMap);
	    return "forward:cartList?user_no=" + member.get("USER_NO");
    } 

    /****************************************************************************************************************
     * 장바구니 삭제 구현
     * @param int cart_no , HttpSession session
     * @query : 
     *                   
     ****************************************************************************************************************/
    @GetMapping("cartDelete")    
    public String cartDelete(int cart_no , HttpSession session) { 
        //session 값 받아오기
        Map<String, Object> member = (Map<String, Object>) session.getAttribute("member");
        //리턴값에 forward:cartList?user_no = user_no 넣어주기
        logger.info("장바구니 삭제");
        int result = -1;    
        result = cartLogic.cartDelete(cart_no);
        return "forward:cartList?user_no=" + member.get("USER_NO");
    } 
}