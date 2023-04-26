package com.kh.onthetrain.myPage.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class WeatherAPIController {
    private final String API_KEY = "31274de68eb077bb441d28ad914faa16";
    private final String BASE_URL = "http://api.openweathermap.org/data/2.5/forecast";
    
    @GetMapping("/weather")
    public String getWeather(@RequestParam String weatherLocation, @RequestParam String datepicker) {
        String url = BASE_URL + "?q=" + weatherLocation + "&appid=" + API_KEY;
        RestTemplate restTemplate = new RestTemplate();
        String response = restTemplate.getForObject(url, String.class);
        
        // 조회한 정보를 출력하거나, 사용자에게 반환
        return response;
    }
}

    

