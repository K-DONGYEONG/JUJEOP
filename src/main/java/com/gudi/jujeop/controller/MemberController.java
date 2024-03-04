package com.gudi.jujeop.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gudi.jujeop.logic.MemberLogic;

@Controller
@RequestMapping("/member/*")
public class MemberController {
    Logger logger = LoggerFactory.getLogger(MemberController.class);
    @Autowired
    private MemberLogic memberLogic = null;
	// 회원가입
    @PostMapping("register")
    //public String register(@RequestParam Map<String, Object> pMap, RedirectAttributes redirectAttributes) {
    public String register(HttpSession session, @RequestParam Map<String, Object> pMap) {
        logger.info("회원가입 시도 : "+pMap);

        int result = memberLogic.register(pMap);
		String msg = null;
        // 리다이렉트된 페이지에서 성공 또는 실패 메시지를 표시
        if (result == 1) {
			msg = "회원가입이 완료되었습니다.";
			session.setAttribute("msg", msg);
        } else {
			msg = "회원가입에 실패하였습니다.";
			session.setAttribute("msg", msg);
        }
		logger.info("회원가입 시도2 : ");
        // 회원가입 후 원하는 페이지로 리다이렉트
        return "redirect:./memberjoinCompletion.jsp";
    }

	//로그인한 회원의 정보를 가져오는 메소드
	public Map<String, Object> member(String user_id) {
        logger.info("유저 정보 가져갈거야");
		Map<String, Object> member = memberLogic.member(user_id);
		return member;
	}

	// 로그인
	@GetMapping("login")
	public String login(@RequestParam Map<String, Object> pMap, HttpSession session) {
        logger.info("로그인 시도했어?");

		// 1을 반환하면 로그인 성공 0을 반환하면 로그인 실패
		int result = memberLogic.login(pMap);
		Map<String, Object> member = member(pMap.get("user_id").toString());
		// 1을 반환하고 user_id가 admin일시 관리자페이지로 리다이렉트
		if (result == 1 && pMap.get("user_id").equals("admin")){
            logger.info("너 관리자야?");
			return "redirect:/index.jsp";
		} else if (result == 1) { // 아이디가 admin이 아니면 일반회원으로 간주
            logger.info("너 일반회원이야?");
			session.setAttribute("member", member);
			return "redirect:/main/mainHompage.jsp";
		} else if (result == 0) { // 로그인실패시 틀렸다고 alert을 주고 로그인창으로 다시 리다이렉트
			return "redirect:loginError.jsp";
		}
		return null;
	}

	// 로그아웃
	@GetMapping("logout")
	public String logout(HttpServletRequest request) {
        logger.info("너 로그아웃했어?");
        HttpSession session = request.getSession(false); 
		/* 유효성 체크 */
		if(session != null) {
			session.invalidate();
		}
		return "redirect:/main/mainHompage.jsp";
	}
}