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

import yjc.wdb.safe.bean.CafeBean;
import yjc.wdb.safe.bean.CafeBoardBean;
import yjc.wdb.safe.bean.CafeMemberBean;
import yjc.wdb.safe.bean.ChildrenBean;
import yjc.wdb.safe.bean.MessageBean;
import yjc.wdb.safe.dao.ChildrenDao;
import yjc.wdb.safe.dao.MessageDao;



@Controller
@SessionAttributes("Message")
public class MessageController {
	
	@Autowired 
	private MessageDao dao;
	@Autowired 
	private ChildrenDao c_dao;
	
	
	@RequestMapping(value="/messageinsert", method=RequestMethod.GET)
	public String MessageinsertForm(Model model){
		
		MessageBean Message = new MessageBean();
		Message.setCategory(0);
		model.addAttribute("Message",Message);

		return "/WEB-INF/message/messageinsertForm.jsp";
	}
	
	@RequestMapping(value="/selectMessage", method=RequestMethod.GET)
	public String selectMessageForm(Model model,@RequestParam String write_id,@RequestParam String send_id,@RequestParam int board_num){
		
		MessageBean Message = new MessageBean();
		Message.setBoard_num(board_num);
		Message.setWrite_id(write_id);
		Message.setSend_id(send_id);
		Message.setCategory(1);
		
		model.addAttribute("Message",Message);

		return "/WEB-INF/message/selectMessage.jsp";
	}
	
	@RequestMapping(value="/selectMessage", method=RequestMethod.POST)
	public String selectMessage(@ModelAttribute("Message") MessageBean Message){
		
		
		dao.insertMessage(Message);
		
		return "redirect:/safe/MessageList";
	}
	
	
	@RequestMapping(value = "/selectFemale", method = RequestMethod.GET)
	   public String selectFemale(@RequestParam String write_id, Model model,
	         @RequestParam String send_id,
	         @RequestParam int category) {
	      MessageBean m = new MessageBean();
	   
	      
	         m.setWrite_id(write_id);
	         m.setSend_id(send_id);
	         m.setBoard_num(1);
	         model.addAttribute("m",m);
	         dao.updateFe(m);
	      

	      return "redirect:/safe/selectSuccess";

	   }
	
	
	@RequestMapping(value="/messageinsert",method=RequestMethod.POST)
	public String Messageinsert(@ModelAttribute("Message") MessageBean Message){

		String[] select = Message.getSend_id().split(",");
		if(select.length == 0){
		dao.insertMessage(Message);
		return "redirect:/safe/MessageList";
		}
		
		for(int i=0; i<select.length; i++){
			Message.setSend_id(select[i]);
			dao.insertMessage(Message);
		}
		
		
		return "redirect:/safe/MessageList";
	}
	
	@RequestMapping("/MessageList")
	public String MessageList(){
		return "/WEB-INF/message/MessageList.jsp";
	}
	
	

	@RequestMapping(value="/WriteMessage", method=RequestMethod.GET)
	public String writeMessage(Model model,@RequestParam String write_id){
		
		List<MessageBean> Message = dao.writeMessage(write_id);
		
		model.addAttribute("Message",Message);

		return "/WEB-INF/message/writeMessage.jsp";
	}
	
	
	@RequestMapping(value="/SendMessage", method=RequestMethod.GET)
	public String SendMessage(Model model,@RequestParam String send_id){
		
		List<MessageBean> Message = dao.sendMessage(send_id);
		
		model.addAttribute("Message",Message);

		return "/WEB-INF/message/sendMessage.jsp";
	}
	
	
	@RequestMapping(value="/ViewMessage", method=RequestMethod.GET)
	public String WriteListMessage(Model model, int write_num){
		
		MessageBean message = dao.selectMessage(write_num);
		
		model.addAttribute("message",message);
		
		return "/WEB-INF/message/ViewMessage.jsp";
		
		
	}
	
	//신청확인시
	@RequestMapping(value="/selectchildren",method=RequestMethod.GET)
	public String selectchildren(@RequestParam int board_num,@RequestParam String write_id,Model model,@RequestParam String send_id){
		
		ChildrenBean children = c_dao.selectChildren(board_num);
		MessageBean message = new MessageBean();
		if(children.getCategory()==1 && children.getE_id() != null){
			return "/WEB-INF/message/selectError.jsp";
		}else if(children.getCategory() == 2){
			
			message.setWrite_id(write_id);
			message.setSend_id(send_id);
			dao.e_selectchildren(message);
		}else if(children.getCategory() == 1){
			
			message.setBoard_num(board_num);
			message.setWrite_id(write_id);
			dao.selectE_id(message);
		}
		
		
		return "redirect:/safe/selectSuccess";
		
	}
	
	
	
	@RequestMapping(value="/Messagedelete", method=RequestMethod.GET)
	public String Messagedelete(Model model, int write_num){
		
		dao.deleteMessage(write_num);
		
		return "/WEB-INF/message/MessageList.jsp";
		
		
	}
	
	
	
	
	@RequestMapping(value="/messageSelect", method=RequestMethod.GET)
	public String messageSelect(Model model, @RequestParam String id,@RequestParam int category){
		
		
		if(category == 1){
		List<CafeBoardBean> list = dao.messageSelect(id);
		model.addAttribute("list",list);
		}else{
			List<CafeBean> list = dao.messageSelect_e(id);
			model.addAttribute("list",list);
		}
		return "/WEB-INF/message/messageSelect.jsp";
		
		
	}
	
	
	
	
	@RequestMapping(value="/cafe_memberSelect", method=RequestMethod.GET)
	public String cafe_memberSelect(Model model, @RequestParam int cafe_select){
		
		List<CafeMemberBean> cafe_member_list = dao.cafe_memberSelect(cafe_select);
		
		model.addAttribute("cafe_member_list",cafe_member_list);
		
		return "/WEB-INF/message/messageSelect2.jsp";
		
		
	}
	
	
}
