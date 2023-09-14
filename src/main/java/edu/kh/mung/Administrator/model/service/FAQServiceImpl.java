package edu.kh.mung.Administrator.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mung.Administrator.model.dao.FAQDAO_o;
import edu.kh.mung.Administrator.model.dto.Administrator;

@Service
public class FAQServiceImpl implements FAQService {

	@Autowired
	private FAQDAO_o dao;

	/**
	 * faq 리스트 업
	 */
	@Override
	public Map<String, Object> selectFaqList(int boardCode) {

		int listCount = dao.getListCount(boardCode);

		List<Administrator> boardList = dao.selectBoardList(boardCode);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardList", boardList);

		return map;
	}

	/**
	 * faq 등록
	 */
	@Override
	public int faqInsert(Administrator administrator) {
		return dao.faqInsert(administrator);
	}

	/**
	 * faq 수정
	 */
	@Override
	public int faqUpdate(Administrator administrator) {
		return dao.faqUpdate(administrator);
	}

	/**
	 * faq 삭제
	 */
	@Override
	public int faqDelete(String boardNo) {
		return dao.faqDelete(boardNo);
	}

	@Override
	public Map<String, Object> selectFaqList(Map<String, Object> paramMap) {
		int listCount = dao.getListCount(paramMap);

		List<Administrator> boardList = dao.selectBoardList(paramMap);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardList", boardList);

		return map;
	}
}
