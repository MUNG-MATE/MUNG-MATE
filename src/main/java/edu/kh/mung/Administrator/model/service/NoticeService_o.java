package edu.kh.mung.Administrator.model.service;

import java.util.Map;

public interface NoticeService_o {

	/** 공지사항 리스트 조회
	 * @return
	 */
	Map<String, Object> selectNoticeList(int boardCode);

}
