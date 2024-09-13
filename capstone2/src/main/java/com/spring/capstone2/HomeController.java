package com.spring.capstone2;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "/carbonMarketIntro", method=RequestMethod.GET)
	public String carbonMarketIntro() {
		return "carbonMarketIntro";
	}
	
	@RequestMapping(value = "/simulationIntro", method=RequestMethod.GET)
	public String simulationIntro() {
		return "simulation/simulationIntro";
	}

}
