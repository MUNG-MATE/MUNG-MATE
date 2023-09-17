package edu.kh.mung.Administrator.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kh.mung.Administrator.model.service.NoticeService_o;

@Controller
@RequestMapping("/Administrator")
public class NoticeController_o {
	
	@Autowired
	private NoticeService_o service;
	
	@GetMapping("/notice")
	public String noticeList(Model model
							, @PathVariable int boardCode) {
		
		Map<String, Object> map = service.selectNoticeList(boardCode);

		model.addAttribute("map", map);
		
		return "/Administrator/notice";
	}
	
	
	
	
	
	
	
	
	
}
