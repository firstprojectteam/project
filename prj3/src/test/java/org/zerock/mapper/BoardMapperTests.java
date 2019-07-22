package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod = @__({ @Autowired }))
	private BoardMapper mapper;

	@Test
	public void testInsert() {

		BoardVO vo = new BoardVO();
		vo.setTitle("오늘 저녁 뭐먹을까요");
		vo.setContent("제곧내");
		vo.setWriter("red");
		mapper.insert(vo);
		log.info(vo);
	}

	@Test
	public void testSelect() {

		BoardVO vo = mapper.select(2);
		log.info(vo);
	}
	
	@Test
	public void testUpdate() {
		BoardVO vo = mapper.select(2);
		vo.setTitle("딸기 1");
		vo.setContent("strawberry 1");
		int count = mapper.update(vo);
		log.info(count);
	}
	
	@Test
	public void testDelete() {
		int count = mapper.delete(2);
		log.info("delete count : " + count);
	}
	
	@Test
	public void testSelectAll() {
		List<BoardVO> list = mapper.selectAll();
	    log.info(list);
	}
	
	

}
