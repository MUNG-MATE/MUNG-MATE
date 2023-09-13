package edu.kh.mung.Administrator.model.service;

import java.util.Map;

import edu.kh.mung.Administrator.model.dto.Administrator;

public interface FAQService {

	/** faq 게시글리스트 조회
	 * @param boardCode
	 * @return
	 */
	Map<String, Object> selectFaqList(int boardCode);

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

}
