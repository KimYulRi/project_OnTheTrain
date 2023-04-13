package com.kh.onthetrain.member.api;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
 
public class KakaoLoginBo {
	
	    private static final String CLIENT_ID="***REMOVED***";
	    private static final String CLIENT_SECRET = "***REMOVED***";
	    private final static String REDIRECT_URI = "http://localhost:8088/onthetrain/login/kakao";
	
	    // 카카오 로그인 Url 생성
		public String getAuthorizationUrl() {
			
			// Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 Url 생성
	        OAuth20Service oauthService = new ServiceBuilder()                                                   
	                .apiKey(CLIENT_ID)
	                .apiSecret(CLIENT_SECRET)
	                .callback(REDIRECT_URI)
	                .responseType("code")
	                .build(KakaoLoginApi.instance());
 
	        return oauthService.getAuthorizationUrl();
	    }
		
		// 카카오 로그인 - access 토큰 가져오기
        public String getAccessToken(String authorizeCode) {
    		String accessToken = "";
//	        String refreshToken = "";
    		String reqURL = "https://kauth.kakao.com/oauth/token";
    		try {
    			URL url = new URL(reqURL);
                
    			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
    			
    			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
    			conn.setRequestMethod("POST");
    			conn.setDoOutput(true);
    			
    			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
    			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
    			StringBuilder sb = new StringBuilder();
    			
    			// 발급받은 key값 & 설정한 주소
    			sb.append("grant_type=authorization_code");	
    			sb.append("&client_id="+CLIENT_ID);
    			sb.append("&redirect_uri="+REDIRECT_URI);
    			sb.append("&client_secret="+CLIENT_SECRET);
    			sb.append("&code=" + authorizeCode);
    			
    			bw.write(sb.toString());
    			bw.flush();
                
    			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
    			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
    			String line = "";
    			String result = "";
                
    			while ((line = br.readLine()) != null) {
    				result += line;
    			}
    			
    			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
    			JsonParser parser = new JsonParser();
    			JsonElement element = parser.parse(result);
                
    			accessToken = element.getAsJsonObject().get("access_token").getAsString();
//	        	refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();
                
    			br.close();
    			bw.close();
    			
    		} catch (IOException e) {
    			e.printStackTrace();
    		}
    		return accessToken;
}
        // 카카오로그인 - api로 유저정보 가져와서 HashMap에 저장
    	public HashMap<String, Object> getUserInfo(String access_Token) {

    		HashMap<String, Object> userInfo = new HashMap<String, Object>();
    		String reqURL = "https://kapi.kakao.com/v2/user/me";
    		try {
    			URL url = new URL(reqURL);
    			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
    			
    			conn.setRequestMethod("GET");
    			// 요청에 필요한 Header에 포함될 내용
    			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

    			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
    			String line = "";
    			String result = "";

    			while ((line = br.readLine()) != null) {
    				result += line;
    			}
    			
    			JsonParser parser = new JsonParser();
    			JsonElement element = parser.parse(result);

    			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
    			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

    			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
    			String email = kakao_account.getAsJsonObject().get("email").getAsString();
    			String id = element.getAsJsonObject().get("id").getAsString();

    			userInfo.put("nickname", nickname);
    			userInfo.put("email", email);
    			userInfo.put("id", id);

    		} catch (IOException e) {
    			e.printStackTrace();
    		}
    		return userInfo;
    	}

        
}