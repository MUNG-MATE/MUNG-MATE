package edu.kh.mung.board.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileUploadException;
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

	// 게시글 삭제
	@Override
	public int boardDelete(Board board) {
		
		int result = dao.boardDelete(board);
		return result;
	}

	// 게시글 작성
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int boardInsert(Board board, List<MultipartFile> images, String webPath, String filePath) throws IllegalStateException, IOException, FileUploadException {
		
		board.setBoardTitle(Util.XSSHandling(board.getBoardTitle()));
		board.setBoardContent(Util.XSSHandling(board.getBoardContent()));

		int boardNo = dao.boardInsert(board);
		
		if (boardNo > 0) { // 게시글 삽입 성공 시

			// List<MultipartFile> images
			// -> 업로드된 파일이 담긴 객체 MultipartFile이 5개 존재
			// -> 단, 업로드된 파일이 없어도 MultipartFile 객체는 존재

			// 실제로 업로드된 파일의 정보를 기록 할 List
			List<BoardImage> uploadList = new ArrayList<>();

			// images에 담겨있는 파일 중 실제 업로드된 파일만을 분류
			for (int i = 0; i < images.size(); i++) {

				// i번째 요소에 업로드한 파일이 있다면
				if (images.get(i).getSize() > 0) {

					BoardImage img = new BoardImage();

					// img에 파일 정보를 담아서 uploadList에 추가
					img.setImagePath(webPath); // 웹 접근경로!
					img.setBoardNo(boardNo); // 게시글 번호
					img.setImageOrder(i); // 이미지 순서

					// 파일 원본명
					String fileName = images.get(i).getOriginalFilename();

					img.setImageReName(Util.fileRename(fileName)); // 변경명

					uploadList.add(img);
				}
			} // 분류 for문 종료

			// 분류 작업 후 uploadList가 비어있지 않은 경우
			// == 업로드한 파일이 있다.
			if (!uploadList.isEmpty()) {

				// BOARD_IMG 테이블에 INSERT 하는 DAO 호출
				int result = dao.insertImageList(uploadList);
				// result == 삽입된 행의 개수 == uploadList.size()

				// 삽입된 행의 개수와 uploadList의 개수가 같다면
				// == 전체 insert 성공
				if (result == uploadList.size()) {
					// 서버에 파일을 저장 transferTo()

					// images : 실제 파일이 담긴 객체 리스트
					// 		    (업로드 안된 인덱스는 빈칸)

					// uploadList : 업로드된 파일의 정보 리스트
					// 				(원본명, 변경명, 순서, 경로, 게시글 번호)

					// 순서 == images 업로드된 인덱스

					for(int i = 0; i < uploadList.size(); i++) {
						int index = uploadList.get(i).getImageOrder();

						// 파일로 변환
						String rename = uploadList.get(i).getImageReName();

						images.get(index).transferTo(new File(filePath + rename));

					}
				} else { // 일부 또는 전체 insert 실패

					// *** 웹 서비스 수행 중 1개라도 실패하면 전체 실패 ***
					// --> rollback이 필요

					// @Transactional(rollbackFor == Exception.class)
					// --> 예외 발생해야지만 롤백

					// [결론]
					// 예외를 강제 발생 시켜서 rollback 해야한다
					// -> 사용자정의 예외 생성

					throw new FileUploadException(); // 예외 강제 발생

				}
			}

		}
		return boardNo;
	}
	
	
}
