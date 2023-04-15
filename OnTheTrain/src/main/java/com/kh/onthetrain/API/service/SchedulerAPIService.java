package com.kh.onthetrain.API.service;

import java.util.List;

import com.kh.onthetrain.API.model.entity.APILocationCode;
import com.kh.onthetrain.API.model.vo.TouristAttraction;

public interface SchedulerAPIService {

	/* 일정 조회 시 사용할 지역코드를 불러오는 메소드 */
	List<APILocationCode> getAllLocationCode();

	/* API를 호출해 행사 정보를 가져오는 메소드 */
	List<TouristAttraction> getSchedulerAPIEvents(String locationcode);
	
}
