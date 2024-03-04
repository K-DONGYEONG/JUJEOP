package com.gudi.jujeop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gudi.jujeop.logic.AuthLogic;

@Controller
@RequestMapping("/auth/*")
public class AuthController {
    
    @Autowired(required = false)
    private AuthLogic authLogic = null;

}
