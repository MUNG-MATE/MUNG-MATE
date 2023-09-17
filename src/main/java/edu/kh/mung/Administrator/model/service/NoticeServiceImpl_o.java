package edu.kh.mung.Administrator.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mung.Administrator.model.dao.NoticeDAO_o;
import edu.kh.mung.Administrator.model.dto.Administrator;

@Service
public class NoticeServiceImpl_o implements NoticeService_o{
	
	@Autowired
	private NoticeDAO_o dao;

	/**
	 * 공지사항 리스트 조회
	 */
	@Override
	public Map<String, Object> selectNoticeList(int boardCode) {
		
		int listCount = dao.getListCount(boardCode);

		List<Administrator> boardList = dao.selectBoardList(boardCode);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardList", boardList);
		
		return map;
	}

}
