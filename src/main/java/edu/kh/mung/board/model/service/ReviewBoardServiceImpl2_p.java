package edu.kh.mung.board.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.mung.board.model.dao.ReviewBoardDAO2_p;
import edu.kh.mung.board.model.dto.Board;
import edu.kh.mung.board.model.dto.BoardImage;
import edu.kh.mung.board.model.exception.ImageDeleteException;
import edu.kh.mung.common.utility.Util;

@Service
public class ReviewBoardServiceImpl2_p implements ReviewBoardService2_p{

	@Autowired
	private ReviewBoardDAO2_p dao;

	// 게시글 수정 서비스
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int reviewUpdate(Board board, List<MultipartFile> images, String webPath, String filePath, String deleteList) throws IllegalStateException, IOException {

		// XSS 방지 처리
		board.setBoardTitle(Util.XSSHandling(board.getBoardTitle()));
		board.setBoardContent(Util.XSSHandling(board.getBoardContent()));

		int rowCount = dao.reviewUpdate(board);

		if(rowCount > 0) {

			if( !deleteList.equals("") ) { //삭제할 이미지가 있다면

				// 3. deleteList에 작성된 이미지 모두 삭제
				Map<String, Object> deleteMap = new HashMap<String, Object>();
				deleteMap.put("boardNo", board.getBoardNo());
				deleteMap.put("deleteList", deleteList);

				rowCount = dao.imageDelete(deleteMap);

				if(rowCount == 0) { // 이미지 삭제 실패 시 전체 롤백
					// -> 예외 강제로 발생 -> rollback 됨
					throw new ImageDeleteException();
				}

			}

			
		

			List<BoardImage> uploadList = new ArrayList<BoardImage>(); 
	
			for (int i = 0; i < images.size(); i++) {
	
				// i번째 요소에 업로드한 파일이 있다면
				if (images.get(i).getSize() > 0) {
	
					BoardImage img = new BoardImage();
	
					// img에 파일 정보를 담아서 uploadList에 추가
					img.setImagePath(webPath); // 웹 접근경로!
					img.setBoardNo(board.getBoardNo()); // 게시글 번호
					img.setImageOrder(i); // 이미지 순서
	
					// 파일 원본명
					String fileName = images.get(i).getOriginalFilename();
	
					img.setImageReName(Util.fileRename(fileName)); // 변경명
	
					uploadList.add(img);
	
	
					// 오라클은 다중UPDATE를 지원하지 않기 때문에
					// 하나씩 UPDATE 수행
	
					rowCount = dao.imageUpdate(img);
	
					if(rowCount == 0) {
						// 수정 실패 == DB에 이미지가 없었다
						// -> 이미지를 삽입
						rowCount = dao.imageInsert(img);
					}
				}
			}
			if (rowCount == uploadList.size()) {
	
				for (int i = 0; i < uploadList.size(); i++) {
	
					int index = uploadList.get(i).getImageOrder();
	
					// 파일로 변환
					String rename = uploadList.get(i).getImageReName();
	
					images.get(index).transferTo(new File(filePath + rename));
	
				}
	
			}
	
	
		}
		return rowCount;
	
	}
	
	
//	//게시글 삭제
//	@Override
//	public int boardDelete(Board board) {
//	
//		int result = dao.boardDelete(board);
//	
//		return result;
//	}
}
