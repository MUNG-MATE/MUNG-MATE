package edu.kh.mung.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mung.board.model.dao.ReplyDAO_p;

@Service
public class ReplyServiceImpl_p implements ReplyService_p{

	@Autowired
	private ReplyDAO_p dao;
}
