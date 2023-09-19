package edu.kh.mung.live.cotroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.kh.mung.live.model.dto.LocationService;
import edu.kh.mung.live.model.service.LiveService;

@Controller
@RequestMapping("/live")
public class LiveController {
	
	@Autowired
	private LiveService service;
	
	@GetMapping
	public String test() {
		return "/live/live";
	}
	
	@GetMapping("/insertLocation")
	@ResponseBody
	public int insertLocation(LocationService ls) {
		
		return service.insertLocation(ls);
	}
	
	@GetMapping("/selectLocation")
	@ResponseBody
	public List<LocationService> selectLocation(LocationService ls) {
		
		return service.selectLocation(ls);
	}
}
