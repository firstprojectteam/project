package org.zerock.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.IntStream;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.MemberVO;

@RestController
public class HelloController {

	@RequestMapping("/hello")
	public String hello() {
		return "Hello Hello";
	}
	
	@RequestMapping("/helloMember")
	public MemberVO helloMember() {
		
		return new MemberVO("aaa","bbb","홍길동");
	}	
	@RequestMapping("/helloMembers")
	public List<MemberVO> helloMembers() {
		List<MemberVO> list = new ArrayList();
		for (int i = 0; i < 100; i++) {
			list.add(new MemberVO("user"+i,"pw"+i,"사용자"+i));
		}
		return list;
	}
	
}
