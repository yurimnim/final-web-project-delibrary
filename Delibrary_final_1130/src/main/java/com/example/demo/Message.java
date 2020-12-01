package com.example.demo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Message {
	

	public Message(String result) {
		super();
		this.result = result;
	}

	private String result;
}