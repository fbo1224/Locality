package com.kh.local.common.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter 
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor 
@Builder
@Component
public class Message {

	private String responseCode; 
	private String message;
	private Object data;
	
}
