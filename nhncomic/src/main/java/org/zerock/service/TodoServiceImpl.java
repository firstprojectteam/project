package org.zerock.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.stereotype.Service;
import org.zerock.domain.TodoVO;

import lombok.extern.java.Log;

@Service
@Log
public class TodoServiceImpl implements TodoService {

	private List<TodoVO> list;
	
	public TodoServiceImpl() {
		
		list = IntStream.range(1,100)
				.mapToObj( i -> new TodoVO("title" +i,"content" + i))
				.collect(Collectors.toList());
	}
	
	@Override
	public void add(TodoVO todo) {
		
		log.info("add" + todo);
		
		list.add(todo);
	}

	@Override
	public TodoVO get(Integer tno) {

		TodoVO temp = new TodoVO();
		temp.setTno(tno);
		
		int idx = list.indexOf(temp);
		
		if(idx == -1) { return null; }
		
		return list.get(idx);
		
		
	}

	@Override
	public List<TodoVO> getAll() {
		log.info("getAll.......");
		return list;
	}

	@Override
	public void modify(TodoVO todo) {
		
		log.info("modify...");
		
		list.remove(todo);
		
		list.add(todo);
		
		log.info("" + list);
	}

	@Override
	public void remove(Integer tno) {
		
		TodoVO temp = new TodoVO();
		temp.setTno(tno);
		
		list.remove(temp);
		
		log.info("" + list);

	}

}
