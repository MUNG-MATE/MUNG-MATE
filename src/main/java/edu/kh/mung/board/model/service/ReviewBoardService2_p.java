package edu.kh.mung.board.model.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.mung.board.model.dto.Board;

public interface ReviewBoardService2_p {

	/** 게시글 수정 서비스
	 * @param board
	 * @param images
	 * @param webPath
	 * @param filePath
	 * @param deleteList 
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	int reviewUpdate(Board board, List<MultipartFile> images, String webPath, String filePath, String deleteList) throws IllegalStateException, IOException;

	
	/** 게시글 삭제 서비스
	 * @param board
	 * @return
	 */
	int boardDelete(Board board);

}
