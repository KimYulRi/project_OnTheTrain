package com.kh.onthetrain.trainTable.service;

import com.kh.onthetrain.trainTable.model.entity.TrainTicket;

public interface trainTableService {
	
	TrainTicket findTrainTableByNo(int ticketNo);
}
