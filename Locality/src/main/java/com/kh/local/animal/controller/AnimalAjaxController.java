package com.kh.local.animal.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.kh.local.animal.model.service.AnimalService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping(value = "boards", produces="application/json; charset=UTF-8")
public class AnimalAjaxController {

	private final AnimalService service;
	
	@GetMapping
	public String findtopBoard() {	
		System.out.println(service.findboard());
		return new Gson().toJson(service.findboard());
	
	}
}
