package com.kh.local.member.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.local.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SocialLoginController {

	@GetMapping("code")
	public void code(String code) throws IOException, ParseException {
		
		String accessToken = getToken(code);
		String socialId = getUserInfo(accessToken);
		System.out.println(socialId);
	}
	
	public String getToken(String code) throws IOException, ParseException{
		
		String tokenUrl = "https://kauth.kakao.com/oauth/token";
		URL url = new URL(tokenUrl);
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		
		urlConnection.setRequestMethod("POST");
		urlConnection.setDoOutput(true);
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(urlConnection.getOutputStream()));
		
		StringBuilder sb = new StringBuilder();
		sb.append("client_id=6a7db0306acb235e8eca7541784693af");
		sb.append("&grant_type=authorization_code");
		sb.append("&redirect_uri=http://localhost:8001/local/code");
		sb.append("&code="+ code);
		
		bw.write(sb.toString());
		bw.flush();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String line = "";
		String responseData = "";
		while((line = br.readLine()) != null) {
			responseData += line;
		}
		
		JSONParser parser = new JSONParser();
		JSONObject element = (JSONObject)parser.parse(responseData);
		
		String accessToken = element.get("access_token").toString();
		
		br.close();
		bw.close();
		
		return accessToken;
	}
	
	public String getUserInfo(String accessToken) throws IOException, ParseException {
		
		String userInfoUrl = "https://kapi.kakao.com/v2/user/me";
		
		URL url = new URL(userInfoUrl);
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		urlConnection.setRequestMethod("GET");
		urlConnection.setRequestProperty("Authorization", "Bearer " + accessToken);
		
		//System.out.println(urlConnection.getResponseCode());
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseData = br.readLine();
		
		JSONObject responseObj = (JSONObject)new JSONParser().parse(responseData);
		
		return responseObj.get("id").toString();
	}	
	
}
