package edu.kh.mung.chatting.controller;

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

@SessionAttributes("loginMember")
@Controller
public class ChattingController {

	@Autowired
	private ChattingService service;

//	// 채팅 페이지
//	@GetMapping("/chatting")
//	public String chatting(@SessionAttribute("loginMember") Member loginMember , Model model) {
//
//		List<ChattingRoom> roomList = service.selectRoomList(loginMember.getMemberNo() );
//		model.addAttribute("roomList", roomList);
//		return "chatting/chatting";
//	}
//
//	// 채팅 읽음 표시
//	@PutMapping("/chatting/updateReadFlag")
//	@ResponseBody
//	public int updateReadFlag(@RequestBody Map<String, Object> paramMap) {
//		return service.updateReadFlag(paramMap);
//	}
//
//	// 채팅방 메세지 조회
//	@GetMapping(value="/chatting/selectMessage", produces="application/json; charset=UTF-8")
//	@ResponseBody
//	public List<Message> selectMessageList(@RequestParam Map<String, Object> paramMap) {
//		return service.selectMessageList(paramMap);
//	}
}
