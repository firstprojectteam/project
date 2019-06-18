package org.zerock.controller;

import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.TodoVO;
import org.zerock.service.TodoService;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@RestController
@AllArgsConstructor
@Log
@RequestMapping("/todo/*")
@CrossOrigin
public class TodoController {

	private TodoService service;
	
	@PostMapping("/new")
	public void register(@RequestBody TodoVO todo) {
		
		log.info("add " + todo);
		service.add(todo);
	}
	//
	@GetMapping("/{tno}")
	public TodoVO read(@PathVariable("tno") Integer tno) {
		
		log.info("tno: " + tno);
		
		return service.get(tno);
		
	}
	
	@GetMapping("/all")
	public List<TodoVO> readAll() {
		
		log.info("read all");
		
		return service.getAll();
		
	}
	
	@PutMapping("/{tno}")
	public void update(@RequestBody TodoVO vo) {
		
		log.info("update" );
		
		service.modify(vo);
	}
	
	@DeleteMapping("/{tno}")
	public void remove(@PathVariable("tno") Integer tno) {
		
		log.info("remove" );
		
		service.remove(tno);
		
	}	
	
	
}
