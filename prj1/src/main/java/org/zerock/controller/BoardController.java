package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
@AllArgsConstructor
public class BoardController {

	private BoardService service;
	
	
	/*
	 * @GetMapping("/list") public void listAll(Model model) {
	 * 
	 * model.addAttribute("list", service.listAll());
	 * 
	 * }
	 */
	
	@GetMapping("/register")
	public void register() {
		log.info("get register...........");
	}
	
	@PostMapping("/register")
	public String register(BoardVO vo, RedirectAttributes rttr) {
		log.info("vo : " + vo);
		Integer newBno = service.register(vo);
		
		rttr.addFlashAttribute("result", newBno);
		return "redirect:/board/list";
	}
	
	@GetMapping("/list")
	public void listPage(@ModelAttribute("cri") Criteria cri, Model model) {
		int totalcount = service.getListCount(cri);
		PageMaker pm = new PageMaker(cri, totalcount);
		model.addAttribute("pm", pm);
		model.addAttribute("list", service.getList(cri));
	}
	
	@GetMapping({"/read","/modify"})
	public void read( @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("bno: " + cri.getBno());
		model.addAttribute("vo", service.get(cri.getBno()));
		
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO vo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		service.modify(vo);
		rttr.addFlashAttribute("result", "Modify");
		return "redirect:/board/list" + cri.getLink();
	}
	
	@PostMapping("/remove")
	public String remove(@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("bno: " + cri.getBno());
		int count = service.remove(cri.getBno());
		
		rttr.addFlashAttribute("result", "Remove");
		cri.setPage(1);
		return "redirect:/board/list"+cri.getLink();
		
	}
}
