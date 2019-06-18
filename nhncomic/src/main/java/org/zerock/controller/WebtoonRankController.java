package org.zerock.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping("/nhn/*")
@CrossOrigin
public class WebtoonRankController {

	@CrossOrigin
	@GetMapping(value = "/comic", produces = "text/xml;charset=UTF-8")
	public ResponseEntity<String> getRanking() {
		
		RestTemplate client = new RestTemplate();
		
		String fooResourceUrl
		  = "https://comic.naver.com/xml/mainTopXml.nhn?order=viewCount&null";
		ResponseEntity<String> response
		  = client.getForEntity(fooResourceUrl + "/1", String.class);
		
		return response;
	}
	
}
