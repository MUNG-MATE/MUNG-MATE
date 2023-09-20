package edu.kh.mung.myPage.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mung.myPage.model.dto.Application;

@Repository
public class ApplicationDAO_c {

	@Autowired
	private SqlSessionTemplate sqlSession;
	/** 일반회원 -> 펫시터 신청하기
	 * @param app
	 * @return result
	 */
	public int insertApp(Application app) {
			
		return sqlSession.insert("appMapper_c.insertApp", app);
	}
	
	/** 일반회원 -> 펫시터 신청한 내역 조회하기
	 * @return appList
	 */
	public List<Application> selectAppList() {
		return sqlSession.selectList("appMapper_c.selectApp");
	}

	/** 관리자가 일반회원 -> 펫시터 신청 수락하기
	 * @param map
	 * @return result
	 */
	public int insertPetsitter(Map<String, Object> map) {
		return sqlSession.insert("appMapper_c.insertPetsitter", map);
	}

	/** 신청 수락이 되었을 때 펫시터 상태가 Y로 전환
	 * @param map
	 * @return
	 */
	public int updateMember(Map<String, Object> map) {
		return sqlSession.update("appMapper_c.updateMember", map);
	}

	/** 신청도 받아주고 펫시터 상태도 변경 했을 때 신청 내역 없애버리기
	 * @param map
	 * @return result
	 */
	public int deleteApp(Map<String, Object> map) {
		return sqlSession.delete("appMapper_c.deleteApp", map);
	}

}
