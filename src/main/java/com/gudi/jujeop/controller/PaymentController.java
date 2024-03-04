package com.gudi.jujeop.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gudi.jujeop.logic.PaymentLogic;

@Controller
@RequestMapping("/payment/*")
public class PaymentController {
    
    Logger logger = LoggerFactory.getLogger(CartController.class);
    @Autowired
    private PaymentLogic paymentLogic = null;

	/* 카카오페이로 결제할시 */
@GetMapping("kakaoPay")
	public String kakaopay(@RequestParam Map<String, Object> pMap, Model model)
	{
		model.addAttribute("pMap",pMap);
		return "forward:/payment/kakaoPay.jsp";
	}
}