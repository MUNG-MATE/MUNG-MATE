package edu.kh.mung.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.mung.board.model.dto.Board;
import edu.kh.mung.main.model.service.MainService_h;
import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.reservation.model.dto.PetSitter;
import edu.kh.mung.reservation.model.dto.Reservation;

@Controller
@SessionAttributes("{loginMember, loginMemberPet}")
public class MainController {
	
	@Autowired
	private MainService_h service;
	
	@RequestMapping("/")
	public String sample(Model model) {
		
		List<Board> reviewList = service.reviewList();
		
		System.out.println(reviewList);
		
		model.addAttribute("reviewList", reviewList);
	
		return "index";
		
	}
	
	@RequestMapping("/info")
	public String info(Reservation rs, Model model,PetSitter petSitter) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		
		List<PetSitter> petSitterList = service.petSitterList();
		
		
		
//		map.put("petSitterNo", petSitterList.petSitterNo());
		
//		int result = service.wishListCheck(map);
		
		
		
		System.out.println("petSitterList = " + petSitterList);
		model.addAttribute("petSitterList", petSitterList);
		
		return "info";
	}
	
	@PostMapping("/wishList")
	@ResponseBody
	public int wishListCheck(@RequestBody Map<String,Integer> paramMap,
							@SessionAttribute(value="loginMember", required = false) Member loginMember) {
		
		
		
		System.out.println("너 뭔데 : " + paramMap);
		
		return service.wishListCheck(paramMap);
		
	};
	
	@PostMapping("/info/myWishList")
	@ResponseBody
	public int myWishList(@RequestBody int petSitterNo,
						@SessionAttribute(value="loginMember", required = true) Member loginMember) {
		
		int result = 0;
		
		if(loginMember != null) {
			
			result = service.myWishList(petSitterNo, loginMember.getMemberNo());
		}
	
		return result;
	}
	
	
	@GetMapping("/petsitterLikeList")
	public String reservation3(@SessionAttribute(value="loginMember", required = true) Member loginMember,
								PetSitter petSitter, Model model) {
		
		List<PetSitter> petSitterList = service.petSitterList();
		
		int memberNo = loginMember.getMemberNo();
		String memberNm = loginMember.getMemberNickname();
		System.out.println("회원 이름 확인 : " + memberNm);
		System.out.println("회원번호확인 : " + memberNo);
		
		List<PetSitter> petSitterLikeList = service.petSitterLikeList(memberNo);
		
		System.out.println("홰긴 : " + petSitterLikeList);
		
		model.addAttribute("memberNm", memberNm);
		model.addAttribute("petSitterLikeList", petSitterLikeList);
		return "/reservation/petsitterLikeList";
	}
	
	
	
	
}
