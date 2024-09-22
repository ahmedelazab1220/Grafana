package com.luv2code.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1")
public class HomeController {
	
	@GetMapping("/home")
	public String home() {
		return "Hello EveryBody!";
	}
	
	@GetMapping("/admin")
	public String admin() {
		return "Hello Admin!";
	}
	
	@GetMapping("/admin")
	public String user() {
		return "Hello User!";
	}
	
}
