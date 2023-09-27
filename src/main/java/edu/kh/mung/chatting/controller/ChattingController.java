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
import edu.kh.mung.chatting.model.service.ChattingService;
import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.reservation.model.dto.PetSitter;
import edu.kh.mung.reservation.model.dto.Reservation;

@SessionAttributes({"loginMember"})
@Controller
public class ChattingController {

	@Autowired
	private ChattingService service;
	
	// 채팅방 입장(없으면 생성)
    @GetMapping("/chatting/enter")
    @ResponseBody
    public int chattingEnter(int targetNo, @SessionAttribute("loginMember") Member loginMember) {
//    	System.out.println("targetNo=="+targetNo);
    	
        Map<String, Integer> map = new HashMap<String, Integer>();
        
        map.put("targetNo", targetNo);
        map.put("memberNo", loginMember.getMemberNo());
        
        int result = service.checkChattingNo(map);
        
        if(result==0) {
        	
        	result = service.createChattingRoom(map);
        }
      
        return result;
    }

	// 채팅 페이지 - 광민
	@GetMapping("/chatting/chatting")
	public String chattingList(@SessionAttribute("loginMember") Member loginMember, Model model) {
		
		
		int memberNo = loginMember.getMemberNo();
		
		
		if(loginMember.getPetsitterFlag().equals("N")) { // 일반회원일때 
			
			List<ChattingRoom> chattingList = service.chattingList(memberNo);
			System.out.println("N=="+chattingList);
			model.addAttribute("chattingList",chattingList);
			List<Reservation> reservation = service.reservation(memberNo);
			model.addAttribute("reservation",reservation);
			return "chatting/chatting";
		}else { //펫시터일때
			List<ChattingRoom> chattingList = service.chattingList1(memberNo);
			
			System.out.println("Y=="+chattingList);
		
			model.addAttribute("chattingList",chattingList);
			List<Reservation> reservation = service.reservation(memberNo);
			model.addAttribute("reservation",reservation);
			return "chatting/chatting";
		}
		
	}
	
	// 채팅방 메세지 조회
	@GetMapping(value="/chatting/selectMessage",produces="application/json; charset=UTF-8")
	@ResponseBody 
	public List<Message> selectMessageList(@RequestParam Map<String, Object> paramMap) {
		return service.selectMessageList(paramMap); 
	}

	// 채팅 읽음 표시
	@PutMapping("/chatting/updateReadFlag")
	@ResponseBody public int updateReadFlag(@RequestBody Map<String, Object> paramMap){ 
		System.out.println("chatting22 == "+paramMap);
		return service.updateReadFlag(paramMap); 

	}
	
	


}
