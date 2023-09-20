package edu.kh.mung.member.model.service;


import java.util.Map;


public interface EmailService_c {
    
   int signUp(String email, String title);
   
    String createAuthKey();


   int checkAuthKey(Map<String, Object> paramMap);
}