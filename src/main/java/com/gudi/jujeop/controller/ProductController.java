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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gudi.jujeop.logic.ProductLogic;

@Controller
@RequestMapping("/product/*")
public class ProductController {
    Logger logger = LoggerFactory.getLogger(CartController.class);

    @Autowired
    private ProductLogic productLogic = null;
    
    // 상품 조회
    // select product_name from TB_PRODUCT where product_no = 1;
    @GetMapping("productList")
    public String productList(@RequestParam Map<String, Object> pMap, Model model) {
        logger.info("productList");
        List<Map<String, Object>> pList = null;
        pList = productLogic.productList(pMap);
        model.addAttribute("pList", pList);
        return "forward:productList.jsp";
    }

    @GetMapping("productBest")
    public String productBest(@RequestParam Map<String, Object> pMap, Model model) {
        logger.info("productBest");
        List<Map<String, Object>> pList = null;
        pList = productLogic.productBest(pMap);
        model.addAttribute("pList", pList);
        return "forward:productBest.jsp";
    }
    
    @GetMapping("productNew")
    public String productNew(@RequestParam Map<String, Object> pMap, Model model) {
        logger.info("productNew");
        List<Map<String, Object>> pList = null;
        pList = productLogic.productNew(pMap);
        model.addAttribute("pList", pList);
        return "forward:productNew.jsp";
    }
    
    @GetMapping("productTak")
    public String productTak(@RequestParam Map<String, Object> pMap, Model model) {
        logger.info("productTak");
        List<Map<String, Object>> pList = null;
        pList = productLogic.productTak(pMap);
        model.addAttribute("pList", pList);
        return "forward:productTak.jsp";
    }

    @GetMapping("productYak")
    public String productYak(@RequestParam Map<String, Object> pMap, Model model) {
        logger.info("productYak");
        List<Map<String, Object>> pList = null;
        pList = productLogic.productYak(pMap);
        model.addAttribute("pList", pList);
        return "forward:productYak.jsp";
    }

    @GetMapping("productGwa")
    public String productGwa(@RequestParam Map<String, Object> pMap, Model model) {
        logger.info("productGwa");
        List<Map<String, Object>> pList = null;
        pList = productLogic.productGwa(pMap);
        model.addAttribute("pList", pList);
        return "forward:productGwa.jsp";
    }

    @GetMapping("productJeung")
    public String productJeung(@RequestParam Map<String, Object> pMap, Model model) {
        logger.info("productJeung");
        List<Map<String, Object>> pList = null;
        pList = productLogic.productJeung(pMap);
        model.addAttribute("pList", pList);
        return "forward:productJeung.jsp";
    }

    // 상품 상세조회
    @GetMapping("productDetail")
        public String productDetail(int product_no, Model model) { 
        logger.info("productDetail" + product_no);
        List<Map<String, Object>> pList = productLogic.productDetail(product_no);
        model.addAttribute("pList", pList);
        return "forward:productDetail.jsp";
    }

    // 상품 입력
    // insert into TB_PRODUCT ( , , ) values ( , , );
    @PostMapping("productInsert")
    public String productInsert(@RequestBody Map<String,Object> pMap) { 
        logger.info("productInsert");
        int result = -1;    
        result = productLogic.productInsert(pMap);
        return "redirect:productInsert.jsp";
    }

    // 상품 수정
    // update TB_PRODUCT set product = '새우깡' where product_no = 1;
    @PostMapping("productUpdate")
    public String productUpdate(int product_no) { 
        logger.info("productUpdate");
        int result = -1;    
        result = productLogic.productUpdate(product_no);
        return "redirect:productUpdate.jsp";
    }

    // 상품 삭제
    // delete from TB_PRODUCT where product_no = 1;
    @PostMapping("productDelete")
    public String productDelete(int product_no) { 
        logger.info("productDelete");
        int result = -1;    
        result = productLogic.productDelete(product_no);
        return "redirect:productDelete.jsp";
    }

    // 상품 검색
	@GetMapping("productSearch")
	public String productSearch(String product_name , Model model){
        logger.info("productSearch");
		List<Map<String, Object>> pList = productLogic.productSearch(product_name);
        logger.info(pList.toString());
		model.addAttribute("pList",pList);
		return "forward:productSearch.jsp";
	}

}
