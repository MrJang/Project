package yjc.wdb.safe.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import yjc.wdb.safe.bean.FemaleBean;
import yjc.wdb.safe.bean.SchedulerBean;
import yjc.wdb.safe.bean.memberBean;
import yjc.wdb.safe.bean.zipcodeBean;
import yjc.wdb.safe.dao.ajaxDao;
import yjc.wdb.safe.dao.memberDao;



@Controller
@SessionAttributes("s")
public class m_MemeberController {
	
	@Autowired private memberDao dao;
	private ajaxDao a_dao;
	
	@RequestMapping(value="/m_safe_Main",method=RequestMethod.GET)
	   public String safeMain(Model model, HttpSession session, String REG_ID, String ID, String PW,HttpServletRequest req){   
	      
	      memberBean s = (memberBean)session.getAttribute("s");
	      
	      
	      if (s == null) {
	         
	         if(REG_ID != "" && ID != "" && PW != ""){
	            
	            memberBean login_s = dao.loginMember(ID);
	             
	            if(login_s == null){
	                memberBean log_s = new memberBean();
	                log_s.setReg_id(REG_ID);
	                model.addAttribute("s",log_s);
	                return "/WEB-INF/main/m_main.jsp";
	             }
	             
	             
	            login_s.setReg_id(REG_ID);
	            System.out.println(login_s.getReg_id());
	            if(login_s.getPassword().equals(PW)){
	               dao.insert_reg(login_s);
	               HttpSession se = req.getSession();
	               se.setAttribute("s", login_s);
	               model.addAttribute("s", login_s);
	               return "m_body.main";   
	            }else{
	               System.out.println(login_s.getReg_id());
	               model.addAttribute("s",login_s);
	               return "/WEB-INF/main/m_main.jsp";
	            }
	         }else {
	            
	            return "/WEB-INF/main/m_main.jsp";
	         }
	         
	         
	         
	      } else if(s.getId() != null){
	         
	         return "m_body.main";
	      } else {
	         
	         return "/WEB-INF/main/m_main.jsp";
	      }
	   
	   }
	   
	   @RequestMapping(value="/m_safe_Main",method=RequestMethod.POST)
	   public String safeLogin(@ModelAttribute("s") memberBean s, Model model, HttpServletRequest req){
	      
	      memberBean login_s = dao.loginMember(s.getId());
	      
	      if(login_s != null){
	      
	      if(login_s.getPassword().equals(s.getPassword())){
	         dao.insert_reg(login_s);
	         HttpSession session = req.getSession();
	         session.setAttribute("s", login_s);
	         model.addAttribute("s", login_s);
	         
	         return "m_body.main";
	      }
	      
	      }else{
	         s = new memberBean();
	         model.addAttribute("s",s);
	         return "/WEB-INF/main/m_main.jsp";
	         }
	      
	    
	        
	      return "/WEB-INF/main/m_main.jsp";
	      
	   }

	
	
	
	@RequestMapping("/m_joinMemberSelect")
	public String joinselect(){
		return "/WEB-INF/view/m_joinMemberSelect.jsp";
	}
	
	@RequestMapping(value="/m_addMember_a", method=RequestMethod.GET)
	public String addMemberForm(Model model){
		
		memberBean s = new memberBean();
		s.setCategory(0);
		model.addAttribute("s",s);
		return "/WEB-INF/view/m_addMemberForm_a.jsp";
		
		
	}
	
	@RequestMapping(value="/m_addMember_a", method=RequestMethod.POST)
	public String addMember(@ModelAttribute memberBean s){
		
		dao.insertMember(s);
		
		return "redirect:/safe/m_addSuccess";
	}
	
	@RequestMapping("/m_addSuccess")
	public String addSuccess(){
		return "/WEB-INF/view/m_addSuccess.jsp";
	}
	
	@RequestMapping(value="/m_addMember_u", method=RequestMethod.GET)
	public String addMemberForm_u(Model model,@RequestParam int category){
		
		memberBean s = new memberBean();
		s.setCategory(category);
		
		
		model.addAttribute("s",s);
		return "/WEB-INF/view/m_addMemberForm_u.jsp";
		
		
	}
	
	@RequestMapping(value="/m_checkjoinid/{id}",method=RequestMethod.GET)
	@ResponseBody 
	public ajaxDao checklogin(@PathVariable String id){
		System.out.println(id);
		
		if(dao.loginMember(id) != null){
			a_dao.setDuplicated(true);
		}else {
			a_dao.setDuplicated(false);
		}
		
		return a_dao;
	}
	
	@RequestMapping(value="/m_addMember_u", method=RequestMethod.POST)
	public String addMember_u(@ModelAttribute("s") memberBean s,
			@RequestParam("file") MultipartFile file,HttpServletRequest req,Model model){
	
		
		String fname = null;
		
		try {
			byte[] bytes = file.getBytes();
			String rootPath = req.getServletContext().getRealPath("upload");
			
			File dir = new File(rootPath);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			fname = createUniqueName(file.getOriginalFilename());
					
			File serverFile = new File(dir.getAbsolutePath()+File.separator+fname);
			// �ü���� ���缭 �����ڸ� �������ش�.
			
			System.out.println("filePath:"+serverFile.getAbsolutePath());
			
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
			stream.write(bytes);
			s.setProfile(serverFile.toString());
		
				dao.insertMember(s);
				

			model.addAttribute("s",s);
			stream.close();

		}catch(Exception e){
			
		}
		
		
		return "redirect:/safe/m_addSuccess";
	}
	
	
	
	
	private String createUniqueName(String name) {
		String result = "";
		/*
		 * ex=> name: rose.jpg
		 */
		//name.substring(4);
		int idx = name.lastIndexOf(".");
		if (idx > -1) {
			String tmp = name.substring(0, idx);
			tmp = tmp+System.currentTimeMillis();
			result = tmp + name.substring(idx);
		} else {
			result = result+System.currentTimeMillis();
		}
		return result;
	}
	
	@RequestMapping(value="/m_updateMember", method=RequestMethod.GET)
	public String updateMemberForm(@RequestParam String id, Model model, memberBean s){
		
		s = dao.selectmember(id);
		model.addAttribute("s",s);
		return "m_updateMemberForm.member";
	}
	
	@RequestMapping(value="/m_updateMember", method=RequestMethod.POST)
	public String updateMember(@ModelAttribute("s") memberBean s, SessionStatus session){
		
		dao.updatemember(s);
		session.setComplete();
		return "redirect:/safe/m_updateSuccess";
	}
	
	@RequestMapping("/m_updateSuccess")
	public String updateSuccess(){
		return "m_updateSuccess.member";
	}
	
	@RequestMapping(value="/m_deleteMember", method=RequestMethod.GET)
	public String deleteMemberForm(@RequestParam String id, Model model){
		
		memberBean s = dao.selectmember(id);
		model.addAttribute("s",s);
		return "m_deletePassword.member";
	}
	
	@RequestMapping(value="/m_deleteMember", method=RequestMethod.POST)
	//http://localhost:8080/SpringWeb/spring/addBoardMember
	public String deleteMember(@RequestParam String password, @ModelAttribute("s") memberBean s,SessionStatus session){
		
		if(s.getPassword().equals(password))
		dao.deletemember(s.getId());
		session.setComplete();
		
		return "m_deleteSuccess.member";
		
	}
	
	@RequestMapping(value="/m_listMember", method=RequestMethod.GET)
	//http://localhost:8080/SpringWeb/spring/addBoardMember
	public String listMember(Model model){
		
		List<memberBean> list = dao.selectAll();
		
		model.addAttribute("list",list);
		return "m_listMember.member";
		
	}
	
	@RequestMapping(value="/m_listMemberView", method=RequestMethod.GET)
	//http://localhost:8080/SpringWeb/spring/addBoardMember
	public String viewMember(@RequestParam String id, Model model){
		
		memberBean s= dao.selectmember(id);
		
		model.addAttribute("s",s);
		return "m_listMemberView.member";
		
	}
	
//	@RequestMapping(value="/zipcode", method=RequestMethod.GET)
//	//http://localhost:8080/SpringWeb/spring/addBoardMember
//	public String zipcodeForm(Model model){
//		zipcodeBean zipcode = new zipcodeBean();
//		model.addAttribute("zipcode",zipcode);
//		
//		return "/WEB-INF/view/zipcodeForm.jsp";
//		}
//	
//	@RequestMapping(value="/zipcode", method=RequestMethod.POST)
//	//http://localhost:8080/SpringWeb/spring/addBoardMember
//	public String zipcode(@ModelAttribute("zipcode") zipcodeBean zip, Model model){
//		
//		List<zipcodeBean> list = dao.zipselect(zip.getDong());
//		
//		model.addAttribute("list",list);
//		return "/WEB-INF/view/zipcodeForm.jsp";
//		
//	}
	
	@RequestMapping(value="/m_safe_logout", method=RequestMethod.GET)
	//http://localhost:8080/SpringWeb/spring/addBoardMember
	public String safe_logout(Model model, SessionStatus session){
		
		session.setComplete();
		memberBean s = new memberBean();
		model.addAttribute("s",s);
		
		return "/WEB-INF/view/m_safe_logout.jsp";
	
	}
	@RequestMapping(value="/m_safe_Mypage")
	//http://localhost:8080/SpringWeb/spring/addBoardMember
	public String safe_Mypage(){
		return "m_safe_Mypage.member";
		}
	
	
	@RequestMapping(value="/m_homeSecurity")
	//http://localhost:8080/SpringWeb/spring/addBoardMember
	public String homeSecurity(){
		
		return "m_homeSecurity.member";
		}
	
	
	
		
}
