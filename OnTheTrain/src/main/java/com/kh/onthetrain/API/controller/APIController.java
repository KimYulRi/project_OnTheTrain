package com.kh.onthetrain.API.controller;

import java.net.URI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/api")
public class APIController {

	@Autowired
	private RestTemplate restTemplate;

	@ResponseBody
	@GetMapping("/scheduler/events")
	public void getSchedulerEvents() {
		log.info("getSchedulerEvents 메소드 실행");

		String url = "https://apis.data.go.kr/B551011/KorService1/areaBasedSyncList1";
		String mobileOS = "WIN";
		String mobileApp = "OTT";
		String serviceKey = "TA8wFHWB4VK8xAZeIOHrDL8DLD/0GVBP4AsJy3laedFjv2kO+BTZi+uRLwiaAEr/HVOjGqztsFtVkUKONU6UEw==";
		String responseType = "json";
		String contentTypeId = "15";
		String areaCode = "1";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(url)
				.queryParam("MobileOS", mobileOS)
				.queryParam("MobileApp", mobileApp)
				.queryParam("serviceKey", serviceKey)
				.queryParam("_type", responseType)
				.queryParam("contentTypeId", contentTypeId)
				.queryParam("areaCode", areaCode);
		URI requestUri = builder.build().encode().toUri();

		HttpEntity<String> entity = new HttpEntity<>(headers);

		ResponseEntity<String> response = restTemplate.exchange(requestUri, HttpMethod.GET, entity, String.class);

		System.out.println(response.getBody());

	}
}
