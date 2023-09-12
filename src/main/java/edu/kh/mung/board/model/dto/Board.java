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
	private int reviewStar;
	private int boardCode;
	private int memberNo;


	// 서브쿼리

	// 회원 join
	private String memberNickname;
	private String profileImage;

	// 이미지 목록
	private List<BoardImage> imageList;

	// 댓글 목록
	private List<Reply> replyList;
}
