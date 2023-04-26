package com.kh.onthetrain.API.service;

import java.net.URI;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.onthetrain.API.model.entity.APILocationCode;
import com.kh.onthetrain.API.model.mapper.SchedulerAPIMapper;
import com.kh.onthetrain.API.model.vo.TouristAttraction;
import com.kh.onthetrain.API.model.vo.TouristAttraction2;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SchedulerAPIServiceimpl implements SchedulerAPIService {

	@Autowired
	private RestTemplate restTemplate;

	@Autowired
	private SchedulerAPIMapper mapper;

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

	/* 일정 조회 시 사용할 지역코드를 불러오는 메소드 */
	@Override
	public List<APILocationCode> getAllLocationCode() {
		return mapper.SelectLocationCodeList();
	}

	/* 지역기반 관광정보 조회 API를 호출해 행사 정보를 가져오는 메소드 */
	@Override
	public List<TouristAttraction> getSchedulerAPIEvents(String locationcode) {
		log.info("getSchedulerAPIEvents 메소드 호출");
		List<TouristAttraction> talist = new ArrayList<>();

		int numOfRows = 12;
		int pageNo = 1;
		String targeturl = "/areaBasedSyncList1";
		String url = visitKoreaBaseUrl + targeturl;

		/* 15 = 행사정보 */
		String contentTypeId = "15";

		try {
			URI requestUri = UriComponentsBuilder.fromUriString(url)
					.queryParam("numOfRows", numOfRows)
					.queryParam("pageNo", pageNo)
					.queryParam("serviceKey", jeongjunDataEn)
					.queryParam("MobileOS", mobileOS)
					.queryParam("MobileApp", mobileApp)
					.queryParam("contentTypeId", contentTypeId)
					.queryParam("areaCode", locationcode)
					.queryParam("_type", "json").build(true).toUri();

			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			HttpEntity<String> entity = new HttpEntity<>(headers);
			ResponseEntity<String> response = restTemplate.exchange(requestUri, HttpMethod.GET, entity, String.class);

			/* 반환값을 TouristAttraction에 매핑 */
			if (response.getBody() != null) {
				ObjectMapper objectMapper = new ObjectMapper();
				JsonNode rootNode = objectMapper.readTree(response.getBody());

				JsonNode responseNode = rootNode.path("response");
				if (responseNode != null && responseNode.isObject()) {
					JsonNode headerNode = responseNode.path("header");
					JsonNode bodyNode = responseNode.path("body");
					JsonNode itemsNode = bodyNode.path("items");
					JsonNode itemArrayNode = itemsNode.path("item");
					if (itemArrayNode.isArray()) {
						for (JsonNode itemNode : itemArrayNode) {
							TouristAttraction touristAttraction = new TouristAttraction();
							touristAttraction.setTitle(itemNode.path("title").asText());
							touristAttraction.setAddr1(itemNode.path("addr1").asText());
							touristAttraction.setAddr2(itemNode.path("addr2").asText());
							touristAttraction.setAreacode(itemNode.path("areacode").asText());
							touristAttraction.setBooktour(itemNode.path("booktour").asText());
							touristAttraction.setCat1(itemNode.path("cat1").asText());
							touristAttraction.setCat2(itemNode.path("cat2").asText());
							touristAttraction.setCat3(itemNode.path("cat3").asText());
							touristAttraction.setContentid(itemNode.path("contentid").asText());
							touristAttraction.setContenttypeid(itemNode.path("contenttypeid").asText());
							touristAttraction.setCreatedtime(itemNode.path("createdtime").asText());
							touristAttraction.setFirstimage(itemNode.path("firstimage").asText());
							touristAttraction.setFirstimage2(itemNode.path("firstimage2").asText());
							touristAttraction.setCpyrhtDivCd(itemNode.path("cpyrhtDivCd").asText());
							touristAttraction.setMapx(itemNode.path("mapx").asText());
							touristAttraction.setMapy(itemNode.path("mapy").asText());
							touristAttraction.setMlevel(itemNode.path("mlevel").asText());
							touristAttraction.setModifiedtime(itemNode.path("modifiedtime").asText());
							touristAttraction.setSigungucode(itemNode.path("sigungucode").asText());
							touristAttraction.setTel(itemNode.path("tel").asText());
							touristAttraction.setZipcode(itemNode.path("zipcode").asText());
							touristAttraction.setShowflag(itemNode.path("showflag").asText());
							talist.add(touristAttraction);
						}
					}

					log.info("API 호출 완료" + talist.toString());
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return talist;
	}

	/* 행사정보조회 API를 호출해 행사 정보를 가져오는 메소드 */
	@Override
	public List<TouristAttraction2> getSchedulerAPIEvents2(String locationcode, String startDate) {
		log.info("getSchedulerAPIEvents2 메소드 호출");
		List<TouristAttraction2> talist = new ArrayList<>();

		int numOfRows = 12;
		int pageNo = 1;
		String targeturl = "/searchFestival1";
		String url = visitKoreaBaseUrl + targeturl;
		String eventStartDate = startDate;

		/* 15 = 행사정보 */
		String contentTypeId = "15";

		try {
			URI requestUri = UriComponentsBuilder.fromUriString(url)
					.queryParam("numOfRows", numOfRows)
					.queryParam("pageNo", pageNo)
					.queryParam("serviceKey", jeongjunDataEn)
					.queryParam("MobileOS", mobileOS)
					.queryParam("MobileApp", mobileApp)
					.queryParam("areaCode", locationcode)
					.queryParam("eventStartDate", eventStartDate)
					.queryParam("_type", "json").build(true).toUri();

			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			HttpEntity<String> entity = new HttpEntity<>(headers);
			ResponseEntity<String> response = restTemplate.exchange(requestUri, HttpMethod.GET, entity, String.class);

			/* 반환값을 TouristAttraction2에 매핑 */
			if (response.getBody() != null) {
				ObjectMapper objectMapper = new ObjectMapper();
				JsonNode rootNode = objectMapper.readTree(response.getBody());

				JsonNode responseNode = rootNode.path("response");
				if (responseNode != null && responseNode.isObject()) {
					JsonNode headerNode = responseNode.path("header");
					JsonNode bodyNode = responseNode.path("body");
					JsonNode itemsNode = bodyNode.path("items");
					JsonNode itemArrayNode = itemsNode.path("item");
					if (itemArrayNode.isArray()) {
						for (JsonNode itemNode : itemArrayNode) {
							TouristAttraction2 touristAttraction = new TouristAttraction2();
							touristAttraction.setAddr1(itemNode.path("addr1").asText());
							touristAttraction.setAddr2(itemNode.path("addr2").asText());
							touristAttraction.setAreacode(itemNode.path("areacode").asText());
							touristAttraction.setBooktour(itemNode.path("booktour").asText());
							touristAttraction.setCat1(itemNode.path("cat1").asText());
							touristAttraction.setCat2(itemNode.path("cat2").asText());
							touristAttraction.setCat3(itemNode.path("cat3").asText());
							touristAttraction.setContentid(itemNode.path("contentid").asText());
							touristAttraction.setContenttypeid(itemNode.path("contenttypeid").asText());
							touristAttraction.setCreatedtime(itemNode.path("createdtime").asText());
							touristAttraction.setEventstartdate(itemNode.path("eventstartdate").asText());
							touristAttraction.setEventenddate(itemNode.path("eventenddate").asText());
							touristAttraction.setFirstimage(itemNode.path("firstimage").asText());
							touristAttraction.setFirstimage2(itemNode.path("firstimage2").asText());
							touristAttraction.setCpyrhtDivCd(itemNode.path("cpyrhtDivCd").asText());
							touristAttraction.setMapx(itemNode.path("mapx").asText());
							touristAttraction.setMapy(itemNode.path("mapy").asText());
							touristAttraction.setMlevel(itemNode.path("mlevel").asText());
							touristAttraction.setModifiedtime(itemNode.path("modifiedtime").asText());
							touristAttraction.setSigungucode(itemNode.path("sigungucode").asText());
							touristAttraction.setTel(itemNode.path("tel").asText());
							touristAttraction.setTitle(itemNode.path("title").asText());

							talist.add(touristAttraction);

						}
					}

					log.info("API 호출 완료" + talist.toString());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return talist;
	}
}
