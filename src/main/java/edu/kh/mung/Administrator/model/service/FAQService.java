package edu.kh.mung.Administrator.model.service;

import java.util.Map;

import edu.kh.mung.Administrator.model.dto.Administrator;

public interface FAQService {

	/** faq 게시글리스트 조회
	 * @param boardCode
	 * @return
	 */
	Map<String, Object> selectFaqList(int boardCode, int cp);

	/** faq 글 등록
	 * @param boardCode
	 * @return
	 */
	int faqInsert(Administrator administrator);

	/** faq 글 수정
	 * @param administrator
	 * @return
	 */
	int faqUpdate(Administrator administrator);

	/**faq 삭제
	 * @param boardNo
	 * @return
	 */
	int faqDelete(String boardNo);

	
	
	/** faq 게시글 리스트 조회 (검색일 때)
	 * @param paramMap
	 * @return
	 */
	Map<String, Object> selectSearchList(Map<String, Object> paramMap, int cp);

}
