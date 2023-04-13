package com.kh.onthetrain.member.api;

import java.io.IOException;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
 
public class NaverLoginBo {
	private final static String CLIENT_ID = "***REMOVED***";
	private final static String CLIENT_SECRET = "***REMOVED***";
	private final static String REDIRECT_URI = "http://localhost:8088/onthetrain/login/naver";
	private final static String SESSION_STATE = "oauth_state";
	// 프로필 조회 API URL
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
	private String apiResult = null;
	    
	// 네이버 로그인 URL 생성
	public String getAuthorizationUrl(HttpSession session) {
		
		// 세션 유효성 검증을 위하여 난수 생성, session에 저장
		String state = generateRandomString();
		setSession(session,state);        
 
		// Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 Url 생성
		OAuth20Service oauthService = new ServiceBuilder()                                                   
				.apiKey(CLIENT_ID)
				.apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI)
				.state(state) 
				.build(NaverLoginApi.instance());
		return oauthService.getAuthorizationUrl();
	}
 
    // 네이버아이디로 Callback 처리 및  AccessToken 획득 Method
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException{
 
		// Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인
		String sessionState = getSession(session);
		// access토큰 획득
		if(StringUtils.pathEquals(sessionState, state)){
			OAuth20Service oauthService = new ServiceBuilder()
					.apiKey(CLIENT_ID)
					.apiSecret(CLIENT_SECRET)
					.callback(REDIRECT_URI)
					.state(state)
					.build(NaverLoginApi.instance());
 
            //Scribe에서 제공하는 AccessToken 획득 기능
            OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
            return accessToken;
        }
		
        return null;
        }
	
	// Access Token을 이용하여 사용자 정보 받아오기
	public HashMap<String, Object> getUserInfo(OAuth2AccessToken oauthToken) throws IOException{
		
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(CLIENT_ID)
				.apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI).build(NaverLoginApi.instance());
		
		// 로그인 사용자 정보를 읽어온다.
		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
		oauthService.signRequest(oauthToken, request);
		Response response = request.send();
 		apiResult = response.getBody();
 		System.out.println(apiResult);
 		

 		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(apiResult);
		JsonObject jsonObj = element.getAsJsonObject().get("response").getAsJsonObject();
		
		String nickname = jsonObj.getAsJsonObject().get("nickname").getAsString();
		String email = jsonObj.getAsJsonObject().get("email").getAsString();
		String id = jsonObj.getAsJsonObject().get("id").getAsString();

		userInfo.put("nickname", nickname);
		userInfo.put("email", email);
		userInfo.put("id", id);
 		
		return userInfo;
		
	}
 
    // 세션 유효성 검증을 위한 난수 생성기
    private String generateRandomString() {
        return UUID.randomUUID().toString();
    }
 
    // 세션 데이터 저장
    private void setSession(HttpSession session,String state){
        session.setAttribute(SESSION_STATE, state);     
    }
 
    // 세션 데이터 가져오기
    private String getSession(HttpSession session){
        return (String) session.getAttribute(SESSION_STATE);
    }
    
    
 
}