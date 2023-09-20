package edu.kh.mung.member.controller;


import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.mung.member.model.service.EmailService_c;

@Controller
@RequestMapping("/sendEmail")
@SessionAttributes("authKey")
public class EmailController_c {
    
    @Autowired
    private EmailService_c service;
    
    @GetMapping("/signUp")
    @ResponseBody
    public int signUp(String email) {
        return service.signUp(email, "이메일");
    }
    
    
    @GetMapping("/checkAuthKey")
    @ResponseBody
    public int checkAuthKey(@RequestParam Map<String, Object> paramMap){


       System.out.println(paramMap); // {inputKey=wc3rxG, email=knbdh@nate.com}
        
        return service.checkAuthKey(paramMap);
    }
    
}