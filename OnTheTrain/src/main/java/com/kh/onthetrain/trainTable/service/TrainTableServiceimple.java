package com.kh.onthetrain.trainTable.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onthetrain.trainTable.model.vo.TrainBook;
import com.kh.onthetrain.trainTable.model.vo.TrainTicket;
import com.kh.onthetrain.trainTable.model.mapper.trainTableMapper;


@Service
public class TrainTableServiceimple implements TrainTableService {
	
	@Autowired
	private trainTableMapper mapper;
	
//	@Override
//	public void save(TrainTicket trainTicket) {
//		mapper.insertTicket(trainTicket);
//	}
//	
// 	@Override
// 	public int createReservation(TrainBook trainBook) {
// 		int result = 0;
// 		
// 		if(trainBook.getBookNo() >0) {
// 			
// 		} else {
// 			result = mapper.insertReservation(trainBook);
// 		}
// 		
//		return result;
// 	}

}
