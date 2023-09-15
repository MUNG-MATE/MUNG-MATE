package edu.kh.mung.board.model.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Board {

	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String boardDate;
	private String boardState;
	private int boardCode;
	private int memberNo;
	private String imagePath;
	private String boardName;
	private String imageReName;

	// 서브쿼리
	private int replyCount; // 댓글 수

	// 서브쿼리

	// 회원 join
	private String memberNickname;
	private String profileImage;

	// 이미지 목록
	private List<BoardImage> imageList;

	// 댓글 목록
	private List<Reply> replyList;
}
