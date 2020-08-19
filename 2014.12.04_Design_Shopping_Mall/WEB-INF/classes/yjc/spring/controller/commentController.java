package yjc.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import yjc.spring.bean.Board;
import yjc.spring.bean.Comment;
import yjc.spring.dao.IbatisCommentDao;

@Controller
@SessionAttributes({"board","comment"})
public class commentController {
	@Autowired
	private IbatisCommentDao  dao;
	
	@RequestMapping(value = "/commentlist", method = RequestMethod.GET)
	public String commentlistForm(@RequestParam int num, Model model, HttpSession session) {
		
		return "";
	}
	@RequestMapping(value = "/commentlist", method = RequestMethod.POST)
	public String commentlist(@ModelAttribute("board") Board b, SessionStatus session) {					
		
		return "";
	}
	@RequestMapping(value = "/commentadd", method = RequestMethod.GET)
	public String commentaddForm(Model model, HttpSession session) {
		Comment c = new Comment();
		model.addAttribute("comment", c);
		return "commentadd";
	}
	@RequestMapping(value = "commentadd", method = RequestMethod.POST)
	public String commentadd(@ModelAttribute("comment") Comment c, HttpServletRequest  req) {
	
		
//		dao.insertComment(c);
		int nextId = dao.selectValue();
		nextId ++;
		dao.updateComment(nextId);
		c.setId(nextId);
		c.setContent(c.getContent());
		c.setName(c.getName());
		c.setNum(c.getNum());
		dao.insertComment(c);
		 
		
		
		return "redirect:resource/reply/commentadd.jsp";
	}

}
