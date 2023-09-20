package edu.kh.mung.myPage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kh.mung.myPage.model.dto.Application;

@Repository
public class ApplicationDAO_o {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 펫시터에서 일반회원 페이지 이동
	 * @param appContent
	 * @param memberNo
	 * @return
	 */
	public int goToGeneral(Application app) {
		
		
		return sqlSession.insert("appMapper_o.goToGeneral",app);
	}

	/** 펫시터에서 일반회원 신청 리스트 조회
	 * @return
	 */
	public List<Application> selectAppList() {
		return sqlSession.selectList("appMapper_o.selectAppList");
	}

	/** 펫시터에서 일반회원으로 전환
	 * @param appNo
	 * @return
	 */
	public int petsitterDelete(int memberNo) {
		return sqlSession.delete("appMapper_o.petsitterDelete", memberNo);
	}

	/** 펫시터 N으로 변경
	 * @param memberNo
	 * @return
	 */
	public int petSitterDeleteN(int memberNo) {
		return sqlSession.update("appMapper_o.petSitterDeleteN", memberNo);
	}

	/** 신청 테이블에서 삭제
	 * @param memberNo
	 * @return
	 */
	public int appDelete(int memberNo) {
		return sqlSession.delete("appMapper_o.appDelete", memberNo);
	}

}
