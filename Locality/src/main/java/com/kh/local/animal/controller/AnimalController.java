package com.kh.local.animal.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.local.animal.model.service.animalService;

@Controller
public class AnimalController {
	
	
	
	
	@ResponseBody
	@RequestMapping(value = "findHospital", produces = "application/json; charset=UTF-8")
	public String findResult(String keyword, String page, String size, String category_name) throws IOException {

		String APIKey = "bd21bc5822efed65086710c29ff5e795";
		keyword = URLEncoder.encode(keyword,"UTF-8");

		// Construct the URL with query parameters
		String originUrl = "https://dapi.kakao.com/v2/local/search/keyword.json";
		originUrl += "?query=" + keyword+ "&page=" + page + "&size=" + size + "&category_name=" + URLEncoder.encode(category_name, "UTF-8");

		URL url = new URL(originUrl);
		
		System.out.println(originUrl);

		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setRequestMethod("GET");
		//connection.setRequestProperty("Content-type", "application/json;charset=UTF-8");
		connection.setRequestProperty("Authorization","KakaoAK " + APIKey);

		BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
		
		StringBuilder responseBodyBuilder = new StringBuilder();

		// Read response line by line and append to the StringBuilder
		String line;
		
		while ((line = br.readLine()) != null) {
	//		System.out.println(line);
		responseBodyBuilder.append(line);
		}
		
		

		System.out.println(responseBodyBuilder.toString());
		br.close();
		           
	
		return responseBodyBuilder.toString();
	}
	
	
	
		
	}
	
	
	

