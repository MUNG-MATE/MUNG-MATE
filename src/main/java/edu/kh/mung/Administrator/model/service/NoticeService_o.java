package edu.kh.mung.Administrator.model.service;

import java.util.Map;

import edu.kh.mung.Administrator.model.dto.Administrator;

public interface NoticeService_o {

	/** 공지사항 리스트 조회
	 * @return
	 */
	Map<String, Object> selectNoticeList(int boardCode, int cp);

	/** 공지사항 게시글 삽입
	 * @param administrator
	 * @return
	 */
	int noticeInsert(Administrator administrator);

	/** 공지사항 수정
	 * @param administrator
	 * @return
	 */
	int noticeUpdate(Administrator administrator);

	/** 공지사항 삭제
	 * @param boardNo
	 * @return
	 */
	int noticeDelete(String boardNo);

	

}
