package edu.kh.mung.live.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mung.live.model.dao.LiveDAO;
import edu.kh.mung.live.model.dto.LocationService;

@Service
public class LiveServiceImpl implements LiveService {
	
	@Autowired
	private LiveDAO dao;
	
	// 펫시터 위치(위도, 경도) 삽입
	@Override
	public int insertLocation(LocationService ls) {
		return dao.insertLocation(ls);
	}
	
	// 펫시터 위치(위도, 경도) 조회
	@Override
	public List<LocationService> selectLocation(LocationService ls) {
		return dao.selectLocation(ls);
	}
	
}
