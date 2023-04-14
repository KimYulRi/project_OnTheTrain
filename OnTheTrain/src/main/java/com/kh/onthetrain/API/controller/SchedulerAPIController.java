package com.kh.onthetrain.API.controller;

import java.net.URI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/api")
public class SchedulerAPIController {

	@Autowired
	private RestTemplate restTemplate;

	/* 공공데이터 포털 서비스 키 */
	@Value("${key.jeongjunDataEn}")
	private String jeongjunDataEn;

	@Value("${key.jeongjunDataDe}")
	private String jeongjunDataDe;

	/* 한국관광공사_국문 관광정보 서비스_GW */
	private String visitKoreaBaseUrl = "https://apis.data.go.kr/B551011/KorService1";
	// OS 구분 required : IOS (아이폰), AND (안드로이드), WIN (윈도우폰), ETC(기타)
	private String mobileOS = "WIN";
	// MobileApp required
	private String mobileApp = "OnTheTrain";

	/* 지역기반 관광정보 조회 */
	@ResponseBody
	@GetMapping("/scheduler/events")
	public String getSchedulerAPIEvents(
			@RequestParam(name = "location", required = false) String locationcode) {
		log.info("getSchedulerEvents 메소드 실행");
		
		String events = null;
		String targeturl = "/areaBasedSyncList1";
		String url = visitKoreaBaseUrl + targeturl;

		/* 15 = 행사정보 */
		String contentTypeId = "15";

		try {
			URI requestUri = UriComponentsBuilder.fromUriString(url)
					.queryParam("serviceKey",
							jeongjunDataEn)
					.queryParam("MobileOS", mobileOS)
					.queryParam("MobileApp", mobileApp)
					.queryParam("contentTypeId", contentTypeId)
					// 지역 코드가 null값인 경우 전국 행사 검색
					.queryParam("areaCode", locationcode)
					.queryParam("_type", "json")
					.build(true)
					.toUri();

			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			HttpEntity<String> entity = new HttpEntity<>(headers);
			ResponseEntity<String> response = restTemplate.exchange(requestUri, HttpMethod.GET, entity, String.class);

			events = response.getBody();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return events;
	}

}
