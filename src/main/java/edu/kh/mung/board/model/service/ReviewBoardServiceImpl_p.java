package edu.kh.mung.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mung.board.model.dao.ReviewBoardDAO_p;

@Service
public class ReviewBoardServiceImpl_p implements ReviewBoardService_p{
	
	@Autowired
	private ReviewBoardDAO_p dao;

}
