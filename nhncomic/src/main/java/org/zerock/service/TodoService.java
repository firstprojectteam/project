package org.zerock.service;

import java.util.List;

import org.zerock.domain.TodoVO;

public interface TodoService {

	public void add(TodoVO todo);
	
	public TodoVO get(Integer tno);
	
	public List<TodoVO> getAll();
	
	public void modify(TodoVO todo);
	
	public void remove(Integer tno);
	
}
