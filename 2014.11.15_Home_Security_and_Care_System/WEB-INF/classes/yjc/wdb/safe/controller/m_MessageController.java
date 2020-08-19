package yjc.wdb.safe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import yjc.wdb.safe.bean.ChildrenBean;
import yjc.wdb.safe.bean.MessageBean;
import yjc.wdb.safe.dao.ChildrenDao;
import yjc.wdb.safe.dao.MessageDao;

@Controller
@SessionAttributes("Message")
public class m_MessageController {
	
	@Autowired 
	private MessageDao dao;
	@Autowired 
	private ChildrenDao c_dao;
	
	
	@RequestMapping(value="/m_messageinsert", method=RequestMethod.GET)
	public String MessageinsertForm(Model model){
		
		MessageBean Message = new MessageBean();
		Message.setCategory(0);
		model.addAttribute("Message",Message);

		return "m_messageinsertForm.message";
	}
	
	@RequestMapping(value="/m_selectMessage", method=RequestMethod.GET)
	public String selectMessageForm(Model model,@RequestParam String write_id,@RequestParam String send_id,@RequestParam int board_num){
		
		MessageBean Message = new MessageBean();
		Message.setBoard_num(board_num);
		Message.setWrite_id(write_id);
		Message.setSend_id(send_id);
		Message.setCategory(1);
		
		model.addAttribute("Message",Message);

		return "m_selectMessage.message";
	}
	
	@RequestMapping(value="/m_selectMessage", method=RequestMethod.POST)
	public String selectMessage(@ModelAttribute("Message") MessageBean Message){
		
		
		dao.insertMessage(Message);
		
		return "redirect:/safe/m_MessageList";
	}
	
	

	@RequestMapping(value = "/m_selectFemale", method = RequestMethod.GET)
	   public String selectFemale(@RequestParam String write_id, Model model,
	         @RequestParam String send_id,
	         @RequestParam int category) {
	      MessageBean m = new MessageBean();
	   
	      
	         m.setWrite_id(write_id);
	         m.setSend_id(send_id);
	         m.setBoard_num(1);
	         model.addAttribute("m",m);
	         dao.updateFe(m);
	      

	      return "redirect:/safe/m_selectSuccess";

	   }
	
	
	@RequestMapping(value="/m_messageinsert",method=RequestMethod.POST)
	public String Messageinsert(@ModelAttribute("Message") MessageBean Message){

		
		dao.insertMessage(Message);
		
		return "redirect:/safe/m_MessageList";
	}
	
	@RequestMapping("/m_MessageList")
	public String MessageList(){
		return "m_MessageList.message";
	}
	
	
	@RequestMapping(value="/m_WriteMessage", method=RequestMethod.GET)
	public String writeMessage(Model model,@RequestParam String write_id){
		
		List<MessageBean> Message = dao.writeMessage(write_id);
		
		model.addAttribute("Message",Message);

		return "m_writeMessage.message";
	}
	
	@RequestMapping(value="/m_SendMessage", method=RequestMethod.GET)
	public String SendMessage(Model model,@RequestParam String send_id){
		
		List<MessageBean> Message = dao.sendMessage(send_id);
		
		model.addAttribute("Message",Message);

		return "m_sendMessage.message";
	}
	
	@RequestMapping(value="/m_ViewMessage", method=RequestMethod.GET)
	public String WriteListMessage(Model model, int write_num){
		
		MessageBean message = dao.selectMessage(write_num);
		
		model.addAttribute("message",message);
		
		return "m_ViewMessage.message";
		
		
	}
	
	
	@RequestMapping(value="/m_selectchildren",method=RequestMethod.GET)
	public String selectchildren(@RequestParam int board_num,@RequestParam String write_id,Model model,@RequestParam String send_id){
		
		ChildrenBean children = c_dao.selectChildren(board_num);
		MessageBean message = new MessageBean();
		if(children.getCategory()==1 && children.getE_id() != null){
			return "/WEB-INF/message/m_selectError.jsp";
		}else if(children.getCategory() == 2){
			
			message.setWrite_id(write_id);
			message.setSend_id(send_id);
			dao.e_selectchildren(message);
		}else if(children.getCategory() == 1){
			
			message.setBoard_num(board_num);
			message.setWrite_id(write_id);
			dao.selectE_id(message);
		}
		
		
		return "redirect:/safe/m_selectSuccess";
		
	}
	
	@RequestMapping(value="/m_Messagedelete", method=RequestMethod.GET)
	public String Messagedelete(Model model, int write_num){
		
		dao.deleteMessage(write_num);
		
		return "m_MessageList.message";
		
		
	}
	

}
