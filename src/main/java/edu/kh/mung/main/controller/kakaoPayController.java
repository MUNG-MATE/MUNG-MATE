package edu.kh.mung.main.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/pay")
public class kakaoPayController {

	
	@RequestMapping("/kakaoPay")
	@ResponseBody
	public String kakaoPay() throws IOException {
		
		URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
		
		HttpURLConnection urlConn = (HttpURLConnection) url.openConnection();
		
		urlConn.setRequestMethod("POST");
		
		urlConn.setRequestProperty("Authorization", "KakaoAK b2b2b7efbc005efe3a0744e4e39a12f4");
		
		urlConn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		urlConn.setDoOutput(true);
		
		String pr = "cid=TC0ONETIME&"; // 가맹점 코드 
		pr += "partner_order_id=partner_order_id&"; // 가맹점 주문번호 
		pr += "partner_user_id=partner_user_id&"; // 가맹점 회원 id
		pr += "item_name=초코파이&"; // 상품명 
		pr += "quantity=1&"; // 상품 수량
		pr += "total_amount=2200&"; // 상품 총액
		pr += "tax_free_amount=0&"; // 상품 비과세 금액
		pr += "approval_url=https://developers.kakao.com/success&"; // 결제 성공시
		pr += "fail_url=https://developers.kakao.com/fail&"; // 결제 실패시
		pr += "cancel_url=https://developers.kakao.com/cancel"; // 결제 취소시 
		
		OutputStream os = urlConn.getOutputStream();
		DataOutputStream dos = new DataOutputStream(os);
		dos.writeBytes(pr);
		
		dos.close();
		
		int resultCode = urlConn.getResponseCode();
		
		InputStream is;
		
		if(resultCode == 200) { // Http 통신에서 정상적인 통신을 하면 200이란 코드가 나오고 그 외엔 전부 에러코드
			is = urlConn.getInputStream();
		}else {
			is = urlConn.getErrorStream();
		}
		
		InputStreamReader isr = new InputStreamReader(is);
		BufferedReader br = new BufferedReader(isr);
		
		String responseText = "";
		String line;
		while((line=br.readLine()) !=null) {
			responseText += line;
		}
		urlConn.disconnect(); 
		
		
		return responseText;
	}
	
}
