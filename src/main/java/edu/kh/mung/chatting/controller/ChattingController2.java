package edu.kh.mung.chatting.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.mung.chatting.model.dto.ChattingRoom;
import edu.kh.mung.chatting.model.dto.Message;
import edu.kh.mung.chatting.model.service.ChattingService2;
import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.reservation.model.dto.Reservation;

@SessionAttributes({"loginMember"})
@Controller
public class ChattingController2 {

	@Autowired
	private ChattingService2 service;
	
	// 채팅 페이지 - 광민
	@GetMapping("/chatting/chatting2")
	public String chattingList2(@SessionAttribute("loginMember") Member loginMember, Model model) {
		
		List<ChattingRoom> chatList = service.chatList(loginMember.getMemberNo());
		model.addAttribute("cahtList",chatList);
		
		return "chatting/chattingM";
	}
	
	// 채팅 상대 조회
    @GetMapping(value="/chatting/target2", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<Reservation> chattingTarget2(@SessionAttribute("loginMember") Member loginMember){
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("memberNo", loginMember.getMemberNo());
    
    	return service.chattingTarget(map);
    }
    
	// 채팅방 생성
    @GetMapping("/chatting/enter2")
    @ResponseBody
    public int chattingEnter2(int targetNo, @SessionAttribute("loginMember") Member loginMember) {
    	
        Map<String, Integer> map = new HashMap<String, Integer>();
        
        map.put("targetNo", targetNo);
        map.put("memberNo", loginMember.getMemberNo());
        
        int result = service.checkChattingNo(map);
        
        if(result==0) {
        	
        	result = service.createChattingRoom(map);
        }
      
        return result;
    }

	
	// 채팅방 메세지 조회
	@GetMapping(value="/chatting/selectMessage2",produces="application/json; charset=UTF-8")
	@ResponseBody 
	public List<Message> selectMessageList2(@RequestParam Map<String, Object> paramMap) {
		return service.selectMessageList(paramMap); 
	}

	// 채팅 읽음 표시
	@PutMapping("/chatting/updateReadFlag2")
	@ResponseBody public int updateReadFlag2(@RequestBody Map<String, Object> paramMap){ 
		System.out.println("chatting22 == "+paramMap);
		return service.updateReadFlag(paramMap); 

	}
	
	


}
