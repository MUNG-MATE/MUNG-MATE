package edu.kh.mung.reservation.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mung.reservation.model.dao.ReservationDao_h;

@Service
public class ReservationServiceImpl_h implements ReservationService_h{

	
	@Autowired
    private ReservationDao_h dao;
}
