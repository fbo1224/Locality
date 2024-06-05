package com.kh.local.animal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;

import com.google.gson.Gson;
import com.kh.local.animal.model.service.AnimalService;


public class AnimalAjaxController {

	@Autowired
	private AnimalService service;
	
	@GetMapping
	public String findBoard() {	
		System.out.println(service.findboard());
		return new Gson().toJson(service.findboard());
	
	}
	
	
}
